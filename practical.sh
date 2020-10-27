#!/bin/bash
#$ -M bcoggins@nd.edu 
#$ -m abe
#$ -N ND_ICG_P7

module load julia
julia practical7.jl --in "LeptodoraBOLDseqs.fasta"
