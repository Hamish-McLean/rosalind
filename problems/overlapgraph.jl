include("../general-functions/readfasta.jl")

"""
Overlap Graphs

    overlap(fasta, k=3)

Calculates the overlap graph for a list of sequences with an overlap length of k.

# Arguments
- `fasta`: a .txt file in fasta format 
- `k`: overlap length
"""
function overlapgraph(fasta, k=3)
    sequences = readfasta(fasta)
    s = ""
    t = ""
    for (key1, value1) in sequences
        s = value1[end-(k-1):end]
        for (key2, value2) in sequences
            t = value2[1:k]
            if key1 != key2 && s == t
                println("$key1 $key2")
            end
        end
    end
end

overlapgraph("overlapfasta.txt")