"""
Rabbits and Recurrence Relations

    rabbit_recurrence(n::Int, k::Int) -> Int

# Arguments
- `n::Int`: the total number of months ≤ 40.
- `k::Int`: litter size (pairs) ≤ 5.

# Returns 
- `Int`: The total number of rabbit pairs that will be present after `n` months.
We begin with 1 pair and in each generation, every pair of reproduction-age rabbits produces a litter of `k` rabbit pairs.
"""
function rabbit_recurrence(n::Int, k::Int)
    rabbits = fill(1, n)
    for i = 3:n
        rabbits[i] = rabbits[i-1] + rabbits[i-2] * k
    end
    println(rabbits[n])
    return rabbits 
end

rabbit_recurrence(32, 2)