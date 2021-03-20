#using Pkg; Pkg.add("BisectPy")
#using BisectPy

include("../BioTools/BioTools.jl")
using .BioTools

"""
Longest Increasing Subsequence

    geneorder(n::Int, p::Array) -> increasing::Array, decreasing::Array

# Arguments
- `n::Int`: a positive integer ≤ 10000.
- `p::Array`: a permutation of length `n`.

# Returns
- `increasing::Array`: longest increasing subsequence of `p`.
- `decreasing::Array`: longest decreasing subsequence of `p`.
"""
function geneorder(n::Int, p::Array)
    I = [[] for i in 1:n]
    D = [[] for i in 1:n]
    I[1] = [p[1]]
    D[1] = [p[1]]
    for i in 2:n
        for j in 1:i
            if p[j] < p[i] && length(I[j]) > length(I[i])
                I[i] = copy(I[j])
            end
            if p[j] > p[i] && length(D[j]) > length(D[i])
                D[i] = copy(D[j])
            end
        end
        append!(I[i], p[i])
        append!(D[i], p[i])
    end
    longest_I = 1
    longest_D = 1
    for i in 1:n
        if length(I[i]) > length(I[longest_I])
            longest_I = i
        end
        if length(D[i]) > length(D[longest_D])
            longest_D = i
        end
    end
    return I[longest_I], D[longest_D]
end


n = 5
p = [1, 5, 4, 2, 3]

#println(geneorder(n, p))



file = open("rosalind_lgis.txt") do file
    read(file, String)
end
arr = split(file, "\n")
n = parse(Int, arr[1])
p = parse.(Int, split(arr[2], " "))
#println(n)

#println(geneorder(n, p))
I, D = geneorder(n, p)
[print("$i ") for i in I]
println()
[print("$j ") for j in D]