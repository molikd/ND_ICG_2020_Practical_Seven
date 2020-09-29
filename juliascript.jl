#! usr/bin/env julia
using Pkg
Pkg.activate()

Pkg.add("BioSequences")
using BioSequences

Pkg.add("FASTX")
using FASTX

Pkg.add("ArgParse")
using ArgParse

Pkg.add("GeneticVariation")
using GeneticVariation

#Parse arguments
s = ArgParseSettings()
@add_arg_table! s begin
	"--input"
		help = "an input fasta file"
		required = true
end

parsed_args = parse_args(ARGS, s)


#set arguments as variables
input_fasta = parsed_args["input"]


#create array to put sequences in 
sequence_array = BioSequence{DNAAlphabet{4}}[]

#read the fasta and put each sequence in a new position in sequence_array
r = open(FASTX.FASTA.Reader, input_fasta)
for record in r
    push!(sequence_array, FASTX.FASTA.sequence(record))
end
close(r)

println(sequence_array)

freq = gene_frequency(sequence_array)

println("Gene Frequency of input fasta:")
println(freq)

