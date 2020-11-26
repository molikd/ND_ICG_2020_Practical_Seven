#!usr/bin/env julia

using Pkg
Pkg.activate(".")
Pkg.add("BioSequences")
using BioSequences
Pkg.add("FASTX")
using FASTX
Pkg.add("GeneticVariation")
using GeneticVariation
Pkg.add("ArgParse")
using ArgParse

s = ArgParseSettings()
@add_arg_table! s begin
	"--input"
end

parsed_args = parse_args(ARGS, s)

input = parsed_args["input"]

sequences = BioSequence{DNAAlphabet{4}}[]

fasta=open(FASTX.FASTA.Reader, input)

for seq in fasta
    push!(sequences, FASTX.FASTA.sequence(seq))
end

comp=BioSequences.composition(sequences)

final = gene_frequencies(comp)

println(final)
