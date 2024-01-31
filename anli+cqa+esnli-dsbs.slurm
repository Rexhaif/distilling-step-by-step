#!/bin/bash
#SBATCH --job-name=D_sbs_ANLI_CQA_eSNLI
#SBATCH --nodes=1
#SBATCH --gres=gpu:1
#SBATCH --cpus-per-task=8
#SBATCH --time=24:00:00
#SBATCH --mem=64GB
#SBATCH --output=logs/D_sbs_ANLI_CQA_eSNLI-%j.out

echo "============================================"
echo "Start running experiments on ANLI+CQA+eSNLI(test on CQA) dataset..."
echo "============================================"
nvitop -1
echo "============================================"

# Run your deep learning experiment command
python run.py \
    --from_pretrained google/t5-v1_1-base \
    --dataset anli+cqa+esnli \
    --model_type task_prefix \
    --label_type llm \
    --llm palm \
    --alpha 0.5 \
    --batch_size 32 \
    --max_steps 60000

# End of script
