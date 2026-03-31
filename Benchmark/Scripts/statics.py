import os
import re
import glob
import argparse
import numpy as np
import pandas as pd

from sklearn.metrics import (
    accuracy_score,
    precision_recall_fscore_support,
    confusion_matrix,
)

def extract_id_from_filename(fp: str) -> str:
    """
    尝试从文件名中提取 ID（尽量兼容多种命名）：
      - result{ID}.csv / result_ID.csv / result-ID.csv / result(ID).csv
      - scmap_result{ID}.csv / XXX{ID}.csv
    提取不到就用去掉后缀的文件名作为 ID
    """
    base = os.path.basename(fp)
    name = re.sub(r"\.csv$", "", base, flags=re.IGNORECASE)

    # 优先匹配：result 后面的 ID
    m = re.search(r"result[\_\-\(\{]?\s*([A-Za-z0-9\.]+)\s*[\)\}]?$", name, flags=re.IGNORECASE)
    if m:
        return m.group(1)

    # 再匹配：文件名末尾的数字/字母ID（如 xxx_12 / xxx12）
    m2 = re.search(r"([A-Za-z0-9\.]+)$", name)
    if m2:
        return m2.group(1)

    return name

def eval_summary_metrics(y_true: np.ndarray, y_pred: np.ndarray):
    labels = sorted(set(y_true) | set(y_pred), key=lambda x: x.lower())
    acc = float(accuracy_score(y_true, y_pred))

    def avg_metrics(avg: str):
        p, r, f1, _ = precision_recall_fscore_support(
            y_true, y_pred, labels=labels, average=avg, zero_division=0
        )
        return float(p), float(r), float(f1)

    p_macro, r_macro, f1_macro = avg_metrics("macro")
    p_micro, r_micro, f1_micro = avg_metrics("micro")
    p_weighted, r_weighted, f1_weighted = avg_metrics("weighted")

    return {
        "accuracy": acc,
        "macro_precision": p_macro,
        "macro_recall": r_macro,
        "macro_f1": f1_macro,
        "micro_precision": p_micro,
        "micro_recall": r_micro,
        "micro_f1": f1_micro,
        "weighted_precision": p_weighted,
        "weighted_recall": r_weighted,
        "weighted_f1": f1_weighted,
    }

def eval_per_class_metrics(y_true: np.ndarray, y_pred: np.ndarray, labels_mode: str = "union"):
    """
    输出每类：TP/FP/FN/TN, accuracy(one-vs-rest), precision/recall/f1, support
    labels_mode:
      - "true": 只对真实标签出现过的类输出
      - "union": 对真实∪预测出现过的类输出（默认）
    """
    if labels_mode == "true":
        labels = sorted(set(y_true), key=lambda x: x.lower())
    elif labels_mode == "union":
        labels = sorted(set(y_true) | set(y_pred), key=lambda x: x.lower())
    else:
        raise ValueError("labels_mode must be 'true' or 'union'")

    p, r, f1, support = precision_recall_fscore_support(
        y_true, y_pred, labels=labels, average=None, zero_division=0
    )

    cm = confusion_matrix(y_true, y_pred, labels=labels)
    total = cm.sum()
    tp = np.diag(cm)
    fp = cm.sum(axis=0) - tp
    fn = cm.sum(axis=1) - tp
    tn = total - tp - fp - fn

    acc_ovr = (tp + tn) / total if total > 0 else np.nan

    df = pd.DataFrame({
        "celltype": labels,
        "support": support.astype(int),
        "TP": tp.astype(int),
        "FP": fp.astype(int),
        "FN": fn.astype(int),
        "TN": tn.astype(int),
        "accuracy": acc_ovr.astype(float),
        "precision": p.astype(float),
        "recall": r.astype(float),
        "f1": f1.astype(float),
    })

    df = df.sort_values(["support", "celltype"], ascending=[False, True]).reset_index(drop=True)
    return df

def read_labels_from_csv(csv_path: str, true_col: str, pred_col: str, sep: str = ","):
    df = pd.read_csv(csv_path, sep=sep)
    if true_col not in df.columns:
        raise KeyError(f"[{os.path.basename(csv_path)}] true_col '{true_col}' not found. Columns: {list(df.columns)}")
    if pred_col not in df.columns:
        raise KeyError(f"[{os.path.basename(csv_path)}] pred_col '{pred_col}' not found. Columns: {list(df.columns)}")

    y_true = df[true_col].astype(str).to_numpy()
    y_pred = df[pred_col].astype(str).to_numpy()
    return y_true, y_pred

def main():
    parser = argparse.ArgumentParser(
        description="Batch evaluate prediction CSV files: (1) one summary CSV + (2) per-file per-class CSV."
    )
    parser.add_argument("--path", required=True, help="Folder containing prediction CSV files (e.g., XXX{ID}.csv).")
    parser.add_argument("--software", required=True, help="Software name (for output CSV columns & filename).")
    parser.add_argument("--dataset", required=True, help="Dataset name (for output CSV columns & filename).")
    parser.add_argument("--true_col", required=True, help="Column name in CSV for true labels.")
    parser.add_argument("--pred_col", required=True, help="Column name in CSV for predicted labels.")
    parser.add_argument("--out_dir", required=True, help="Output directory for CSV files (summary + per-file).")

    parser.add_argument("--pattern", default="*.csv", help="Glob pattern in --path, default: *.csv")
    parser.add_argument("--sep", default=",", help="CSV separator, default ',' (use '\\t' for TSV)")
    parser.add_argument("--labels_mode", default="union", choices=["union", "true"],
                        help="Per-class output labels set: union(true,pred) or true-only. Default union.")
    parser.add_argument("--perfile_subdir", default="per_file",
                        help="Subfolder under out_dir to store per-file per-class CSVs. Default: per_file")

    args = parser.parse_args()

    in_dir = os.path.abspath(args.path)
    out_dir = os.path.abspath(args.out_dir)
    os.makedirs(out_dir, exist_ok=True)

    per_dir = os.path.join(out_dir, args.perfile_subdir)
    os.makedirs(per_dir, exist_ok=True)

    files = sorted(glob.glob(os.path.join(in_dir, args.pattern)))
    if not files:
        raise FileNotFoundError(f"No files matched: {os.path.join(in_dir, args.pattern)}")

    summary_rows = []

    for fp in files:
        file_id = extract_id_from_filename(fp)
        y_true, y_pred = read_labels_from_csv(fp, true_col=args.true_col, pred_col=args.pred_col, sep=args.sep)

        # 1) summary
        summary_metrics = eval_summary_metrics(y_true, y_pred)
        summary_rows.append({
            "software": args.software,
            "dataset": args.dataset,
            "ID": file_id,
            **summary_metrics
        })

        # 2) per-class
        per_df = eval_per_class_metrics(y_true, y_pred, labels_mode=args.labels_mode)
        per_df.insert(0, "ID", file_id)
        per_df.insert(0, "dataset", args.dataset)
        per_df.insert(0, "software", args.software)

        per_out_csv = os.path.join(per_dir, f"{args.software}_{args.dataset}_{file_id}.csv")
        per_df.to_csv(per_out_csv, index=False)

    summary_df = pd.DataFrame(summary_rows)

    # ID 尝试按数字排序（不可转则按字符串）
    def _sort_key(x):
        try:
            return float(x)
        except:
            return str(x)
    summary_df = summary_df.sort_values(by="ID", key=lambda s: s.map(_sort_key)).reset_index(drop=True)

    summary_csv = os.path.join(out_dir, f"{args.software}_{args.dataset}.csv")
    summary_df.to_csv(summary_csv, index=False)

    print(f"Done. Evaluated {len(files)} CSV files.")
    print(f"Summary CSV: {summary_csv}")
    print(f"Per-file per-class CSVs in: {per_dir}")

if __name__ == "__main__":
    main()
