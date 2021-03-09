include("../BioTools.jl")
using .BioTools


"""
Open Reading Frames

    orfs(fasta::Dict{String,String})

# Arguments
- `fasta::Dict{String,String}`: a DNA string s of length at most 1 kbp in FASTA format.

# Return
- Every distinct candidate protein string that can be translated from ORFs of s. 
Strings can be returned in any order.
"""
function orfs(fasta::Dict{String,String})
    s = collect(values(fasta))[1]
    mrna = transcribe(s)
    cmrna = transcribe(complement(s))
    starts = motifsearch("AUG", mrna)
    cstarts = motifsearch("AUG", cmrna)
    proteins = translateorfs(mrna, starts)
    append!(proteins, translateorfs(cmrna, cstarts))
    return Set(proteins)
end


function translateorfs(seq, starts)
    proteins = []
    for orf in starts
        protein = ""
        for i in orf:3:(length(seq)-2)
            codon = seq[i:i+2]
            aa = translate(codon)
            if aa == "Stop"
                push!(proteins, protein)
                break
            end
            protein *= aa
        end
    end
    return proteins
end

fasta = readfasta("rosalind_orf.txt")

for i in orfs(fasta)
    println(i)
end