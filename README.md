# Few-Shot Classification Codebase

Adopted from **A Baseline for Few-Shot Image Classification** [repo](https://github.com/amazon-research/few-shot-baseline).

## Requisites
- Test Env: Python 3.9.7 (Singularity)
- Packages:
    - torch (1.10.2+cu113), torchvision (0.11.3+cu113)
    - fastai (1.0.61)
    - numpy, scipy, pandas
    - matplotlib, seaborn

## Datasets
We use CIFAR-FS for testing, please refer to *CIFAR-FS/README.md* to prepare the dataset.

## Codebase Testing
```
# edit the paths in your slurm scripts

# pretrain
sbatch pretrain_test.slurm

# finetune
sbatch finetune_test.slurm

# => logs under pretrain_test.log & finetune_test.log
```
