#!/bin/bash

#SBATCH --job-name=04.ancom
#SBATCH --nodes=1
#SBATCH --ntasks=4
#SBATCH --partition=amilan
#SBATCH --time=24:00:00
#SBATCH --qos=normal
#SBATCH --mail-type=ALL
#SBATCH --mail-user=e.s.esdaile@colostate.edu
#SBATCH --output=04.ancom_%j.out

#to classify features, use 8 nodes and 64 tasks. 

module load anaconda

conda activate qiime2-amplicon-2024.10

snakemake \
        -c 4 \
        -s 04.ancom \
        --verbose \
        --printshellcmds

