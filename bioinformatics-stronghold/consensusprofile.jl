"""
Consensus and Profile

    consensus()

"""
function consensus(fasta)
    prof = profile(fasta)
    a = Dict()
    consensus = [] #fill('', 2)
    
    for i in 1:length(prof['A'])
        for (k, v) in prof
            a[k] = v[i]
        end
        push!(consensus, findmax(a)[2])
    end
    return consensus
end

"""
    profile()
"""
function profile(fasta)
    sequences = readfasta(fasta)
    matrix = [seq for seq in values(sequences)]
    profile = Dict(base => fill(0, n) for base in "ACGT",
        n in length(matrix[1]))
    for seq in matrix
        for (i, base) in enumerate(seq)
            profile[base][i] += 1
        end
    end
    return profile
end


"""
    read_fasta(fasta)

Returns a dictionary: Name => sequence.
"""
function readfasta(fasta)
    fastastring = open(fasta) do file
        read(file, String)
    end
    sequences = Dict{String, String}()
    seqstrings = split(fastastring, '>')
    popfirst!(seqstrings)
    for i in seqstrings
        seq = split(i, "\n")
        seqcat = join(seq[2:length(seq)])
        sequences[seq[1]] = seqcat
    end
    return sequences
end


filename = "rosalind_cons.txt"

[print("$i") for i in consensus(filename)]
println()

for base in "ACGT"
    print("$base:")
    [print(" $i") for i in profile(filename)[base]]
    println()
end