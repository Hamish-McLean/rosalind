"""
Rabbits and Recurrence Relations

    rabbit_recurrence(n::Int, k::Int)

# Args
- n: total number of months <= 40
- k: litter size (pairs) <= 5
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