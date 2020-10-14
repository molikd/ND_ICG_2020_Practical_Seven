#!/bin/bash
#$ -M ebrooks5@nd.edu
#$ -m abe
#$ -N BIOS60132_Practical_Seven

#Load modules
module load julia

#Run julia package
julia ./sequenceDiversity.jl practical_four.fasta

#If necessary, use latest GeneticVariation release
# instead of using the Julia REPL
#tar -zxvf GeneticVariation.jl-0.4.0.tar.gz
#cd GeneticVariation.jl-0.4.0
#julia ./sequenceDiversity.jl ../practical_four.fasta
