#!/bin/bash
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


#python /hpcdisk1/baoym_group/zhaow/ModuCell/summary/statics.py --path /hpcdisk1/baoym_group/zhaow/ModuCell/scmap/scmap_outputs_hPancreas \
#      --software scmap_cell  --dataset hPancreas \
#      --true_col celltype --pred_col scmap_cell_pred \
#      --out_dir /hpcdisk1/baoym_group/zhaow/ModuCell/summary --pattern "sce_qry_coldata_cell_*.csv" \
#      --labels_mode true
#
#python /hpcdisk1/baoym_group/zhaow/ModuCell/summary/statics.py --path /hpcdisk1/baoym_group/zhaow/ModuCell/scmap/scmap_outputs_hPancreas \
#      --software scmap_cluster  --dataset hPancreas \
#      --true_col celltype --pred_col scmap_cluster_pred \
#      --out_dir /hpcdisk1/baoym_group/zhaow/ModuCell/summary --pattern "sce_qry_coldata_cluster_*.csv" \
#      --labels_mode true
#python /hpcdisk1/baoym_group/zhaow/ModuCell/summary/statics.py --path /hpcdisk1/baoym_group/zhaow/ModuCell/SingleR/SingleR_outputs_hPancreas \
#      --software singleR  --dataset hPancreas \
#      --true_col celltype --pred_col singleR_pred \
#      --out_dir /hpcdisk1/baoym_group/zhaow/ModuCell/summary --pattern "sce_qry_coldata*.csv" \
#      --labels_mode true
#
#python /hpcdisk1/baoym_group/zhaow/ModuCell/summary/statics.py --path /hpcdisk1/baoym_group/zhaow/ModuCell/scmap/scmap_outputs_kidney \
#      --software scmap_cell  --dataset kidney \
#      --true_col cell_type --pred_col scmap_cell_pred \
#      --out_dir /hpcdisk1/baoym_group/zhaow/ModuCell/summary --pattern "sce_qry_coldata_cell_*.csv" \
#      --labels_mode true
#
#python /hpcdisk1/baoym_group/zhaow/ModuCell/summary/statics.py --path /hpcdisk1/baoym_group/zhaow/ModuCell/scmap/scmap_outputs_kidney \
#      --software scmap_cluster  --dataset kidney \
#      --true_col cell_type --pred_col scmap_cluster_pred \
#      --out_dir /hpcdisk1/baoym_group/zhaow/ModuCell/summary --pattern "sce_qry_coldata_cluster_*.csv" \
#      --labels_mode true
python /hpcdisk1/baoym_group/zhaow/ModuCell/summary/statics.py --path /hpcdisk1/baoym_group/zhaow/ModuCell/SingleR/SingleR_outputs_kidney \
      --software singleR  --dataset kidney \
      --true_col cell_type --pred_col singleR_pred \
      --out_dir /hpcdisk1/baoym_group/zhaow/ModuCell/summary --pattern "sce_qry_coldata*.csv" \
      --labels_mode true

#python /hpcdisk1/baoym_group/zhaow/ModuCell/summary/statics.py --path /hpcdisk1/baoym_group/zhaow/ModuCell/scmap/scmap_outputs_lung \
#      --software scmap_cell  --dataset lung \
#      --true_col cell_type1 --pred_col scmap_cell_pred \
#      --out_dir /hpcdisk1/baoym_group/zhaow/ModuCell/summary --pattern "sce_qry_coldata_cell_*.csv" \
#      --labels_mode true
#
#python /hpcdisk1/baoym_group/zhaow/ModuCell/summary/statics.py --path /hpcdisk1/baoym_group/zhaow/ModuCell/scmap/scmap_outputs_lung \
#      --software scmap_cluster  --dataset lung \
#      --true_col cell_type1 --pred_col scmap_cluster_pred \
#      --out_dir /hpcdisk1/baoym_group/zhaow/ModuCell/summary --pattern "sce_qry_coldata_cluster_*.csv" \
#      --labels_mode true
python /hpcdisk1/baoym_group/zhaow/ModuCell/summary/statics.py --path /hpcdisk1/baoym_group/zhaow/ModuCell/SingleR/SingleR_outputs_lung \
      --software singleR  --dataset lung \
      --true_col cell_type1 --pred_col singleR_pred \
      --out_dir /hpcdisk1/baoym_group/zhaow/ModuCell/summary --pattern "sce_qry_coldata*.csv" \
      --labels_mode true
#
#python /hpcdisk1/baoym_group/zhaow/ModuCell/summary/statics.py --path /hpcdisk1/baoym_group/zhaow/ModuCell/scmap/scmap_outputs_PBMC \
#      --software scmap_cell  --dataset PBMC \
#      --true_col celltype --pred_col scmap_cell_pred \
#      --out_dir /hpcdisk1/baoym_group/zhaow/ModuCell/summary --pattern "sce_qry_coldata_cell_*.csv" \
#      --labels_mode true
#
#python /hpcdisk1/baoym_group/zhaow/ModuCell/summary/statics.py --path /hpcdisk1/baoym_group/zhaow/ModuCell/scmap/scmap_outputs_PBMC \
#      --software scmap_cluster  --dataset PBMC \
#      --true_col celltype --pred_col scmap_cluster_pred \
#      --out_dir /hpcdisk1/baoym_group/zhaow/ModuCell/summary --pattern "sce_qry_coldata_cluster_*.csv" \
#      --labels_mode true
python /hpcdisk1/baoym_group/zhaow/ModuCell/summary/statics.py --path /hpcdisk1/baoym_group/zhaow/ModuCell/SingleR/SingleR_outputs_PBMC \
      --software singleR  --dataset PBMC \
      --true_col celltype --pred_col singleR_pred \
      --out_dir /hpcdisk1/baoym_group/zhaow/ModuCell/summary --pattern "sce_qry_coldata*.csv" \
      --labels_mode true