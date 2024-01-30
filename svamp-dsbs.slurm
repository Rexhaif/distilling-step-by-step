#!/bin/bash
#SBATCH --job-name=D_sbs_SVAMP
#SBATCH --nodes=1
#SBATCH --gres=gpu:1
#SBATCH --cpus-per-task=8
#SBATCH --time=24:00:00
#SBATCH --mem=64GB
#SBATCH --output=logs/D_sbs_SVAMP-%j.out

echo "============================================"
echo "Start running experiments on SVAMP dataset..."
echo "============================================"
nvitop -1
echo "============================================"

# Run your deep learning experiment command
python run.py \
    --from_pretrained google/t5-v1_1-base \
    --dataset svamp \
    --model_type task_prefix \
    --label_type llm \
    --llm palm \
    --alpha 0.5 \
    --batch_size 64

# End of script
