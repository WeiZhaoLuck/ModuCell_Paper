#!/bin/bash

# conda activate ModuCell
# python /lustre/grp/gglab/liut/vv/benchmark/summary/statics_graph.py \
#     --path /lustre/grp/gglab/liut/vv/benchmark/benchmark_cb_lung \
#     --software cb --dataset lung --true_col cell_type1 --pred_col pre \
#     --out_dir /lustre/grp/gglab/liut/vv/benchmark/summary/results --pattern "results*.h5ad" \
#     --labels_mode true
# python /lustre/grp/gglab/liut/vv/benchmark/summary/statics_graph.py \
#     --path /lustre/grp/gglab/liut/vv/benchmark/benchmark_cb_PBMC \
#     --software cb --dataset PBMC --true_col celltype --pred_col pre \
#     --out_dir /lustre/grp/gglab/liut/vv/benchmark/summary/results --pattern "results*.h5ad" \
#     --labels_mode true
# python /lustre/grp/gglab/liut/vv/benchmark/summary/statics_graph.py \
#     --path /lustre/grp/gglab/liut/vv/benchmark/benchmark_cb_hPancreas \
#     --software cb --dataset hPancreas --true_col celltype --pred_col pre \
#     --out_dir /lustre/grp/gglab/liut/vv/benchmark/summary/results --pattern "results*.h5ad" \
#     --labels_mode true
# python /lustre/grp/gglab/liut/vv/benchmark/summary/statics_graph.py \
#     --path /lustre/grp/gglab/liut/vv/benchmark/benchmark_cb_kidney \
#     --software cb --dataset kidney --true_col cell_type --pred_col pre \
#     --out_dir /lustre/grp/gglab/liut/vv/benchmark/summary/results --pattern "results*.h5ad" \
#     --labels_mode true
## TOSICA
# python /lustre/grp/gglab/liut/vv/benchmark/summary/statics_graph.py \
#     --path /lustre/grp/gglab/liut/vv/benchmark/benchmark_TOSICA_lung \
#     --software TOSICA --dataset lung --true_col cell_type1 --pred_col Prediction \
#     --out_dir /lustre/grp/gglab/liut/vv/benchmark/summary/results --pattern "result*.h5ad" \
#     --labels_mode true
# python /lustre/grp/gglab/liut/vv/benchmark/summary/statics_graph.py \
#     --path /lustre/grp/gglab/liut/vv/benchmark/benchmark_TOSICA_PBMC \
#     --software TOSICA --dataset PBMC --true_col celltype --pred_col Prediction \
#     --out_dir /lustre/grp/gglab/liut/vv/benchmark/summary/results --pattern "result*.h5ad" \
#     --labels_mode true
# python /lustre/grp/gglab/liut/vv/benchmark/summary/statics_graph.py \
#     --path /lustre/grp/gglab/liut/vv/benchmark/benchmark_TOSICA_hPancreas \
#     --software TOSICA --dataset hPancreas --true_col celltype --pred_col Prediction \
#     --out_dir /lustre/grp/gglab/liut/vv/benchmark/summary/results --pattern "result*.h5ad" \
#     --labels_mode true
python /lustre/grp/gglab/liut/vv/benchmark/summary/statics_graph.py \
    --path /lustre/grp/gglab/liut/vv/benchmark/benchmark_TOSICA_kidney \
    --software TOSICA --dataset kidney --true_col cell_type --pred_col Prediction \
    --out_dir /lustre/grp/gglab/liut/vv/benchmark/summary/results --pattern "result*.h5ad" \
    --labels_mode true

## scBert
# python /lustre/grp/gglab/liut/vv/benchmark/summary/statics_graph.py \
#     --path /lustre/grp/gglab/liut/vv/benchmark/benchmark_scBert_hLung \
#     --software scBert --dataset lung --true_col cell_type1 --pred_col predicted_celltype \
#     --out_dir /lustre/grp/gglab/liut/vv/benchmark/summary/results --pattern "result*.h5ad" \
#     --labels_mode true
# python /lustre/grp/gglab/liut/vv/benchmark/summary/statics_graph.py \
#     --path /lustre/grp/gglab/liut/vv/benchmark/benchmark_scBert_PBMC \
#     --software scBert --dataset PBMC --true_col celltype --pred_col predicted_celltype \
#     --out_dir /lustre/grp/gglab/liut/vv/benchmark/summary/results --pattern "result*.h5ad" \
#     --labels_mode true
# python /lustre/grp/gglab/liut/vv/benchmark/summary/statics_graph.py \
#     --path /lustre/grp/gglab/liut/vv/benchmark/benchmark_scBert_hPancreas \
#     --software scBert --dataset hPancreas --true_col celltype --pred_col predicted_celltype \
#     --out_dir /lustre/grp/gglab/liut/vv/benchmark/summary/results --pattern "result*.h5ad" \
#     --labels_mode true
# python /lustre/grp/gglab/liut/vv/benchmark/summary/statics_graph.py \
#     --path /lustre/grp/gglab/liut/vv/benchmark/benchmark_scBert_kidney \
#     --software scBert --dataset kidney --true_col cell_type --pred_col predicted_celltype \
#     --out_dir /lustre/grp/gglab/liut/vv/benchmark/summary/results --pattern "result*.h5ad" \
#     --labels_mode true

## ModuCell
# python /lustre/grp/gglab/liut/vv/benchmark/summary/statics_graph.py \
#     --path /lustre/grp/gglab/liut/vv/benchmark/benchmark_ModuCell_lung_final \
#     --software ModuCell --dataset lung --true_col cell_type1 --pred_col pre_sub \
#     --out_dir /lustre/grp/gglab/liut/vv/benchmark/summary/results --pattern "result_*.h5ad" \
#     --labels_mode true
# python /lustre/grp/gglab/liut/vv/benchmark/summary/statics_graph.py \
#     --path /lustre/grp/gglab/liut/vv/benchmark/benchmark_ModuCell_PBMC_final \
#     --software ModuCell --dataset PBMC --true_col celltype --pred_col pre_sub \
#     --out_dir /lustre/grp/gglab/liut/vv/benchmark/summary/results --pattern "result_*.h5ad" \
#     --labels_mode true
# python /lustre/grp/gglab/liut/vv/benchmark/summary/statics_graph.py \
#     --path /lustre/grp/gglab/liut/vv/benchmark/benchmark_scBert_hPancreas \
#     --software scBert --dataset hPancreas --true_col celltype --pred_col predicted_celltype \
#     --out_dir /lustre/grp/gglab/liut/vv/benchmark/summary/results --pattern "results*.h5ad" \
#     --labels_mode true
# python /lustre/grp/gglab/liut/vv/benchmark/summary/statics_graph.py \
#     --path /lustre/grp/gglab/liut/vv/benchmark/benchmark_ModuCell_kidney_final \
#     --software ModuCell --dataset kidney --true_col cell_type --pred_col pre_sub \
#     --out_dir /lustre/grp/gglab/liut/vv/benchmark/summary/results --pattern "result_*.h5ad" \
#     --labels_mode true