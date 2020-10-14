#!/bin/bash
#$ -M ebrooks5@nd.edu
#$ -m abe
#$ -N BIOS60132_Practical_Seven

#Load modules
module load julia

#If necessary, use latest GeneticVariation release
# instead of using the Julia REPL
#tar -zxvf GeneticVariation.jl-0.4.0.tar.gz
#cd GeneticVariation.jl-0.4.0

#Run julia package
julia ./sequenceDiversity.jl
