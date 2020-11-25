#!/bin/bash
#$ -M msievert@nd.edu 
#$ -m abe
#$ -N pac7

module load julia
julia pac7.jl --input "practical_four.fasta"
