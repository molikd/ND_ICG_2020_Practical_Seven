#! usr/bin/env julia
using Pkg
Pkg.add("BioSequences")
Pkg.add("FASTX")
Pkg.activate(".")
Pkg.add("GeneticVariation")

using BioSequences
using FASTX
using GeneticVariation
using ArgParse

s = ArgParseSettings()
@add_arg_table! s begin
	"--FASTA"
		help = "A FASTA file"
		required = true
end

parsed_args = parse_args(ARGS, s)

fasta = parsed_args["FASTA"]
sequence_array = BioSequence{DNAAlphabet{4}}[]
r = open(FASTX.FASTA.Reader, fasta)
for record in r
    push!(sequence_array, FASTX.FASTA.sequence(record))
end
close(r)

println("nucleotide diversity:")
NL79(sequence_array)
