#!/bin/bash

#SBATCH --job-name=sseg
#SBATCH --cpus-per-task=4
#SBATCH --mem=20GB
#SBATCH --time=20:00:00
#SBATCH --gres=gpu:2

singularity exec --nv --bind /scratch/$USER --overlay /scratch/$USER/overlay-25GB-500K.ext3:ro /scratch/$USER/cuda11.4.2-cudnn8.2.4-devel-ubuntu20.04.3.sif /bin/bash -c "
source /ext3/env.sh
cd /scratch/$USER/few-shot-baseline
python finetune.py --dataset CIFAR-FS --architecture Conv64 --way 5 --support_shot 1 --query_shot 15 --num_episodes 1000 > finetune_test.log 2>&1
"