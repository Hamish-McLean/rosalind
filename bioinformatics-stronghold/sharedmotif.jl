include("../general-functions/readfasta.jl")

"""
Finding a Shared Motif

    sharedmotif(fasta) -> String

# Arguments
- `fasta`: a collection of DNA strings in FASTA format.

# Returns
- `String`: a longest common substring of the collection. 
    (If multiple solutions exist, you may return any single solution.)
"""
function sharedmotif(fasta)
    strings = [i for i in values(readfasta(fasta))]
    shortseq = minimum(strings)
    seqlen = length(shortseq)
    motif = ""
    longestmotif = ""
    i = 1
    len = 2
    while len + i <= seqlen + 1
        motif = shortseq[i:i+len-1]
        if all([occursin(motif, seq) for seq in strings])
            longestmotif = motif
            len += 1  # Match, next search for longer matches
        else
            i += 1  # No match, try next position
        end
    end
    return longestmotif
end

println(sharedmotif("motiffasta.txt"))