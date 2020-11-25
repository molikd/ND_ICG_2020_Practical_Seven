#! usr/bin/env julia
import Pkg
using Pkg
Pkg.activate(".")
Pkg.add("GeneticVariation")
Pkg.add("BioSequences")
Pkg.add("FASTX")

using BioSequences, FASTX, GeneticVariation, ArgParse

s = ArgParseSettings()
@add_arg_table! s begin
	"--input"
		help = ":("
		required = true
end

parsed_args = parse_args(ARGS, s)

fasta = parsed_args["input"]
sequence_array = BioSequence{DNAAlphabet{4}}[]
r = open(FASTX.FASTA.Reader, fasta)
for record in r
    push!(sequence_array, FASTX.FASTA.sequence(record))
end
close(r)

sequence_diversity = NL79(sequence_array)
println("sequence diversity")
println(sequence_diversity)
