include("../BioTools.jl")
using .BioTools

"""
Locating Restriction Sites

    palindromes(dna::String, minlen::Int=4, maxlen::Int=12) -> Array

# Arguments
- `dna::String`: a DNA string of length at most 1 kbp.
- `minlen::Int=4`: the minimum length of the palindrome.
- `maxlen::Int=12`: the maximum length of the palindrome.

# Return
- `Array`: the position and length of every reverse palindrome in the string having length between `minlen` and `maxlen`.
"""
function palindromes(dna::String, minlen::Int=4, maxlen::Int=12)
    palindromes = []
    len = length(dna)
    for i in 1:len-minlen+1
        for j in minlen:(i>len-maxlen ? len-i+1 : maxlen)
            if dna[i:i+j-1] == complement(dna[i:i+j-1])
                push!(palindromes, (i, j))
            end
        end
    end
    return palindromes
end

fasta = collect(values(readfasta("rosalind_revp.txt")))[1]

pals = palindromes(fasta)
for pair in pals
    for i in pair
        print("$i ")
    end
    println()
end