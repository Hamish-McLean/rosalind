#using Pkg
#Pkg.add("Combinatorics")
using Combinatorics

"""
Enumerating Gene Orders

    permutor(n::Int) -> Int, Array

# Arguments
- `n::Int`: a positive integer ≤7.

# Returns 
- `Int`: the total number of permutations of length n
- `Array`: a list of all such permutations (in any order).
"""
function permutor(n)
    perms = collect(permutations(1:n))
    println(length(perms))
    for i in perms
        for j in i
            print(j, " ")
        end
        print("\n")
    end
end

permutor(6)

"""
function permutations2(n)
    total = factorial(n)
    perms = []
    for i in 1:n    

    end


    for i in 1:n, j in 1:n, k in 1:n
        perm = Set([i, j, k])
        if length(perm) == n
            push!(perms, perm)
        end
    end
    return total, perms
end

function permeator2(n)
    for i in 1:n 

    end
end

#println(permutations(1:3))

#println(collect(permutations(1:3)))
"""