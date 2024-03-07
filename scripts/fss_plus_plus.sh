#!/bin/bash

# for fold in 0;
# do
#   python main_oss.py \
#     --benchmark fss \
#     --max_sample_iterations 30 \
#     --sample-range "(4,6)" \
#     --multimask_output 0 \
#     --alpha 0.8 --beta 0.2 --exp 1. \
#     --num_merging_mask 10 \
#     --fold ${fold} --log-root "output/fss/fold${fold}" \
#     --use_plus_plus \
#     --patch_wise_sim_thresh 0.1 \
#     --mask_thresh 0.5 \
#     --dinov2-weights ./models/dinov2_vitl14_reg4_pretrain.pth \
#     --use_dense_mask_prompt
# done

#!/bin/bash
for fold in 0;
do
  python main_oss.py  \
    --benchmark fss \
    --nshot 5 \
    --max_sample_iterations 64 \
    --box_nms_thresh 0.65 \
    --sample-range "(4,6)" \
    --topk_scores_threshold 0.0 \
    --use_dense_mask 1 \
    --use_points_or_centers \
    --purity_filter 0.02 \
    --iou_filter 0.85 \
    --multimask_output 1 \
    --sel_stability_score_thresh 0.90 \
    --use_score_filter \
    --alpha 0.8 --beta 0.2 --exp 1 \
    --num_merging_mask 5 \
    --fold ${fold} --log-root "output/fss_5shot/fold${fold}"\
    --use_plus_plus \
    --patch_wise_sim_thresh 0.0 \
    --mask_thresh 0.0 \
    --dinov2-weights ./models/dinov2_vitl14_reg4_pretrain.pth \
    --use_dense_mask_prompt
done