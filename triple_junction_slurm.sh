#!/bin/bash

#SBATCH --time=2-0:00:00
#SBATCH --partition=hpc-1024G
#SBATCH --ntasks=16 --mem=64000
#SBATCH --job-name=V94S

### Mail to user when job starts, terminates, or aborts
### BEGIN|END|FAIL|REQUEUE|ALL
#SBATCH --mail-type=ALL
#SBATCH --mail-user=seifallah.elfetni@bam.de

### Output files
#SBATCH --error=/home/%u/tmp/job.%J.err
#SBATCH --output=/home/%u/tmp/job.%J.out

RUNPATH=$PWD
cd $RUNPATH

# Activate Conda environment
source activate myenv_ML

# Run your Python code with both standard output and error redirected to the same file
python main.py > output.log 2>&1

# Deactivate Conda environment
conda deactivate

