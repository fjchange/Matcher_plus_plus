#!/bin/bash

for fold in 0;
do
  python main_oss.py \
    --benchmark fss \
    --nshot 10 \
    --max_sample_iterations 30 \
    --sample-range "(4,6)" \
    --multimask_output 0 \
    --alpha 0.8 --beta 0.2 --exp 1. \
    --num_merging_mask 5 \
    --fold ${fold} --log-root "output/fss_5shot/fold${fold}"
done

for fold in 0;
do
  python main_oss.py \
    --benchmark fss \
    --nshot 10 \
    --max_sample_iterations 30 \
    --sample-range "(4,6)" \
    --multimask_output 0 \
    --alpha 0.8 --beta 0.2 --exp 1. \
    --num_merging_mask 5 \
    --fold ${fold} --log-root "output/fss_5shot/fold${fold}"\
    --use_plus_plus \
    --patch_wise_sim_thresh 0.3 \
    --mask_thresh 0.5 \
    --dinov2-weights ./models/dinov2_vitl14_reg4_pretrain.pth
done

