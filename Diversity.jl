#!usr/bin/env julia

import Pkg
Pkg.add("ArgParse")
using ArgParse

function parse_commandline()


s = ArgParseSettings()
@add_arg_table s begin
        "--opt1"
                help = "input file"
end

return parse_args(s)
end

files = parse_commandline()
Pkg.add("FASTX")

using FASTX

sequences = open(FASTA.Reader,files["opt1"])
Pkg.add("BioSequences")
using BioSequences
seq = BioSequence{DNAAlphabet{4}}[]
for sequence in sequences 
	push!(seq,FASTA.sequence(sequence))
end 
Pkg.add("GeneticVariation")
using GeneticVariation
diversity = NL79(seq)
println("Diversity:",diversity)

