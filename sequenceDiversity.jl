#!usr/bin/env julia

#Import and add necessary packages
#import Pkg
#Pkg.add("BioSequences")
#Pkg.add("FASTX")
####If necessary, download and activate to
#### add the latest GeneticVariation release
#### instead of using the Julia REPL
####Pkg.activate(".")
#Pkg.add("GeneticVariation")

#Import packages
using BioSequences
using FASTX
using GeneticVariation

#Retrieve input fasta
input=ARGS[1]

#Retrieve input fasta
fasta=open(FASTX.FASTA.Reader, input)

#Initialize array for nucelotide sequences 
sequences=BioSequence{DNAAlphabet{4}}[]

#Retrieve sequences from fasta
for seq in fasta
	#Add each sequence to array
    push!(sequences, FASTX.FASTA.sequence(seq))
end

#Create variable that contains unique sequence counts
composition=BioSequences.composition(sequences)

#Compute allele frequencies
println("Allele frequencies:")
gene_frequencies(composition)

#Compute measures of genetic diversity
println("Average number of mutations:")
avg_mut(sequences)
println("Nucleotide diversity:")
NL79(sequences)