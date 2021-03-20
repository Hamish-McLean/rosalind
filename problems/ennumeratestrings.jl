#using Pkg
#Pkg.add("Combinatorics")
using Combinatorics


"""
Enumerating k-mers Lexicographically

    ennumeratestrings(symbols::Array, n::Int) -> Array

# Arguments
- `symbols::Array`: a collection of at most 10 symbols defining an ordered alphabet
- `n`: a positive integer ≤ 10.

# Returns
- `Array`: all strings of length `n` that can be formed from the alphabet, ordered lexicographically.
"""
function ennumeratestrings(symbols::Array, n::Int)
    combs = collect(with_replacement_combinations(symbols, n))
    perms = []
    strings = []
    [append!(perms, collect(permutations(i))) for i in combs]
    [push!(strings, join(j)) for j in Set(perms)]
    return sort(strings)
end

strings = ennumeratestrings(['A', 'C', 'G', 'T'], 2)

strings = ennumeratestrings(['A', 'B', 'C', 'D', 'E', 'F'], 3)
println.(strings)