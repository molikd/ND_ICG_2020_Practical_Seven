#!usr/bin/env julia

#Import Pkg package
using Pkg

#Add packages
Pkg.add("GeneticVariation")
Pkg.add("BioSequences")
Pkg.add("FASTX")

#Use packages
using GeneticVariation
using BioSequences
using FASTX

#Retrieve input fasta
input=ARGS[1]

#Retrieve fasta sequences
fasta=open(FASTQ.Reader, input)

#Initialize array for nucelotide sequences 
sequences=BioSequence{DNAAlphabet{4}}(fasta)

#Compute allele frequencies
result=gene_frequency(sequences)

#Output gene frequency
println(result)