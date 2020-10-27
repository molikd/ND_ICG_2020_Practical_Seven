#! usr/bin/env julia
using Pkg
Pkg.activate(".")
Pkg.add("BioSequences")
Pkg.add("FASTX")
Pkg.add("GeneticVariation")

using BioSequences, FASTX, GeneticVariation, ArgParse

s = ArgParseSettings()
@add_arg_table! s begin
	"--in"
		help = "must be a fasta file"
		required = true
end

parsed_args = parse_args(ARGS, s)

fasta = parsed_args["in"]
sequence_array = BioSequence{DNAAlphabet{4}}[]
r = open(FASTX.FASTA.Reader, fasta)
for record in r
    push!(sequence_array, FASTX.FASTA.sequence(record))
end
close(r)

nucleotide_diversity = NL79(sequence_array)
println("nucleotide diversity in fasta:")
println(nucleotide_diversity)