#!/bin/bash

#SBATCH --job-name=fs-cls
#SBATCH --cpus-per-task=4
#SBATCH --mem=32GB
#SBATCH --time=4:00:00
#SBATCH --gres=gpu:2

singularity exec --nv --bind /scratch/$USER --overlay /scratch/$USER/overlay-25GB-500K.ext3:ro /scratch/$USER/cuda11.4.2-cudnn8.2.4-devel-ubuntu20.04.3.sif /bin/bash -c "
source /ext3/env.sh
cd /scratch/$USER/few-shot-baseline
python -m fastai.launch pretrain.py --dataset CIFAR-FS --architecture Conv64 > pretrain_test.log 2>&1
"