include("../BioTools.jl")
using .BioTools

"""
RNA Splicing

    rnasplicing(s::String, introns)

# Arguments
- `s::String`: a DNA string (of length at most 1 kbp) and a collection of substrings of s acting as introns. All strings are given in FASTA format.

Return: A protein string resulting from transcribing and translating the exons of s. (Note: Only one solution will exist for the dataset provided.)
"""
function rnasplicing(s::Array)
    seq = popfirst!(s)
    for intron in s
        seq = replace(seq, intron => "")
    end
    protein = translate(transcribe(seq))
    protein = replace(protein, "Stop" => "")
    return protein
end

fasta = readfastastrings("rosalind_splc.txt")

println(rnasplicing(fasta))