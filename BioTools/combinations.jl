export combinations

"""
    combinations(a::Array, n::Int)

# Arguments
- `a::Array`: an array of values to combine.
- `n::Int`: the number of elements to combine.
"""
function combinations(a::Array, n::Int)
    if n == 0
        return [[]] 
    end
    combs =[] 
    for (i, char) in enumerate(a)  
        remaining = a[i + 1:end] 
        for c in combinations(remaining, n-1)
            pushfirst!(c, char)
            push!(combs, c) 
        end
    end       
    return combs 
end