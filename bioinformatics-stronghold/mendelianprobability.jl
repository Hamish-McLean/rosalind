"""
Mendel's First Law

    medelianprobability(k::Int, m::Int, n::Int) -> Int

Calculates the probability of a random mating pair producing an offspring with a dominant allele.

# Arguments
- `k::Int`: number of homozygous dominant individuals
- `m::Int`: number of heterozygous individuals
- `n::Int`: number of homozygous recessive individuals
"""
function mendelian_probability(k::Int, m::Int, n::Int)
    t = k + m + n
    t1 = t - 1
    pk = k/t + (t-k)/t * k/t1
    pmm = m/t * (m-1)/t1
    pmn = m/t * n/t1 + n/t * m/t1
    probability = pk + 3/4 * pmm + 1/2 * pmn
    return probability
end

println(mendelian_probability(22, 22, 27))