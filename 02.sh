#!/bin/bash

#SBATCH --job-name=02.denoise
#SBATCH --nodes=1
#SBATCH --ntasks=4
#SBATCH --partition=amilan
#SBATCH --time=24:00:00
#SBATCH --qos=normal
#SBATCH --mail-type=ALL
#SBATCH --mail-user=e.s.esdaile@colostate.edu
#SBATCH --output=02.denoise_%j.out

module load anaconda

conda activate qiime2-amplicon-2024.10

snakemake \
        -c 4 \
        -s 02.denoise \
        --verbose \
        --printshellcmds

