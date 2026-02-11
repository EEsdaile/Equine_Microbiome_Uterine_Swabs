#!/bin/bash

#SBATCH --job-name=03.taxonomy_greengenes
#SBATCH --nodes=8
#SBATCH --ntasks=64
#SBATCH --partition=amilan
#SBATCH --time=24:00:00
#SBATCH --qos=normal
#SBATCH --mail-type=ALL
#SBATCH --mail-user=e.s.esdaile@colostate.edu
#SBATCH --output=03.taxonomy_greengenes_%j.out

#to classify features, use 8 nodes and 64 tasks. same with taxonomy step that uses sepp file.

module load anaconda

conda activate qiime2-amplicon-2024.10

snakemake \
        -c 64 \
        -s 03.taxonomy_greengenes \
        --verbose \
        --printshellcmds

