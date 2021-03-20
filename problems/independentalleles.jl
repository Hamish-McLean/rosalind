"""
Independent Alleles

    independentalleles(k::Int, N::Int) -> Float64

In this problem, we begin with Tom, who in the 0th generation has genotype Aa Bb. Tom has two children in the 1st generation, each of whom has two children, and so on. Each organism always mates with an organism having genotype Aa Bb.

# Arguments
- `k::Int`: number of generations (≤ 7).
- `N::Int`: number of heterozygous individuals in the k-th generation (≤ 2^k).

# Returns
- `Float64`: the probability that at least N organisms with genotype Aa Bb will belong to the k-th generation.
Assume that Mendel's second law holds for the factors.
"""
function independentalleles(k::Int, N::Int)
    p = 0
    pop = 2^k
    pr = 1/4
    npr = 3/4
    for num in N:pop
        bin = factorial(big(pop))/(factorial(big(num))*factorial(big(pop-num)))
        p += bin * pr^num * npr^(pop - num)
    end
    return p
end

println(independentalleles(2, 1))
println(independentalleles(5, 7))