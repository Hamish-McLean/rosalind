"""
Mortal Fibonacci Rabbits

    mortalfibonaccirabbits(n::Int, m::Int)

Calculates the rabbit population after `n` months given that the rabbits take 1 month to mature and once mature, give birth to 1 baby every month. Rabbits die after 3 months.

# Args
- `n::Int`: total number of months <= 100
- `m::Int`: lifespan in months <= 20
"""
function mortalfibonaccirabbits(n::Int, m::Int)
    babies = [1, 0]
    adults = [0, 1]
    for i = 3:n
        push!(babies, adults[i-1])
        newadults = babies[i-1] + adults[i-1]
        i > (m) ? newadults -= babies[i-m] : Nothing
        push!(adults, newadults)
    end
    println(babies)
    println(adults)
    return babies[n] + adults[n]  
end

println(mortalfibonaccirabbits(89, 18))
