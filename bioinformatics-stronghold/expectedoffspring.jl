"""
Calculating Expected Offspring

    expectedoffspring(g)

Calculates the probability of offspring displaying the dominant phenotype given the number of each parent genotype pair. Each pair has two offspring.

P(dominant|genotype)
1. AA-Aa | p=1
2. AA-Aa | p=1
3. AA-aa | p=1
4. Aa-Aa | p=3/4
5. Aa-aa | p=2/4
6. aa-aa | p=0

# Arguments
- `g`: a vector of 6 integers 
"""
expectedoffspring(g) = 2(sum(g[1:3]) + 3/4*g[4] + 2/4*g[5])

testgenotypes = [1, 0, 0, 1, 0, 1]

examgenotypes = [17506, 19388, 16798, 18613, 17450, 19557]

println(expectedoffspring(examgenotypes))