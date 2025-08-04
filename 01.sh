#!/bin/bash

#SBATCH --job-name=01.demultiplex
#SBATCH --nodes=1
#SBATCH --ntasks=4
#SBATCH --partition=amilan
#SBATCH --time=24:00:00
#SBATCH --mail-type=ALL
#SBATCH --mail-user=e.s.esdaile@colostate.edu
#SBATCH --output=01.demultiplex_%j.out

module load anaconda

conda activate qiime2-amplicon-2024.10

snakemake \
        -c 4 \
        -s 01.demultiplex \
        --verbose \
        --printshellcmds

