include("../general-functions/BioTools.jl")

using .BioTools

"""
Consensus and Profile

    consensus(fasta) -> String

# Arguments
- `fasta`: a collection of at DNA strings of equal length in FASTA format.

# Returns
- `String`: a consensus string for the collection.
"""
function consensus(fasta)
    prof = profile(fasta)
    a = Dict()
    consensus = [] #fill('', 2)
    
    for i in 1:length(prof['A'])
        for (k, v) in prof
            a[k] = v[i]
        end
        push!(consensus, findmax(a)[2])
    end
    return consensus
end

"""
    profile()
"""
function profile(fasta)
    sequences = readfasta(fasta)
    matrix = [seq for seq in values(sequences)]
    profile = Dict(base => fill(0, n) for base in "ACGT",
        n in length(matrix[1]))
    for seq in matrix
        for (i, base) in enumerate(seq)
            profile[base][i] += 1
        end
    end
    return profile
end


filename = "rosalind_cons.txt"

[print("$i") for i in consensus(filename)]
println()

for base in "ACGT"
    print("$base:")
    [print(" $i") for i in profile(filename)[base]]
    println()
end