#!/bin/bash

#SBATCH --job-name=03.2_classifier
#SBATCH --nodes=16
#SBATCH --ntasks=64
#SBATCH --partition=amilan
#SBATCH --time=24:00:00
#SBATCH --qos=normal
#SBATCH --mail-type=ALL
#SBATCH --mail-user=e.s.esdaile@colostate.edu
#SBATCH --output=03.2_classifier_%j.out

module load anaconda

conda activate qiime2-amplicon-2024.10

qiime feature-classifier fit-classifier-naive-bayes \
--i-reference-reads /projects/c829993361@colostate.edu/2025_16S_Equine_Microbiome_Data/silva_taxonomy_138.2/silva_138.2_seqs_reverse_transcript.qza \
--i-reference-taxonomy /projects/c829993361@colostate.edu/2025_16S_Equine_Microbiome_Data/silva_taxonomy_138.2/silva_138.2_taxonomy.qza \
--o-classifier silva_138.2_classifier.qza

