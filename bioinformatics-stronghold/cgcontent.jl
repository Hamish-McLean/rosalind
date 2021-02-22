include("../general-functions/readfasta.jl")


"""
Computing GC Content

    cgcontent(fasta) -> Dict{String, Float64}

Calculates CG percentage of sequences in FASTA format and returns the name and CG percentage of the sequence with the highest CG content.

# Arguments
- `fasta`: a text file in fasta format.

# Returns
- `Dict{String, Float64}`: a dictionary of Name => cg %.
"""
function cgcontent(fasta)
    sequences = readfasta(fasta)
    cgcontent = Dict{String, Float64}()
    for seq in sequences
        cgcontent[seq[1]] = cgpercent(seq[2])
    end
    for i in cgcontent
        println("$(i[1]): $(i[2]) %")
    end
    maxcg = findmax(cgcontent)
    println("\n$(maxcg[2])\n$(maxcg[1])")
    return cgcontent
end


"""
    cgpercent(seq)

Returns the CG percent of a given sequence.
"""
function cgpercent(seq)
    cgcount = 0
    for base in seq
        if base == 'C' || base == 'G'
            cgcount += 1
        end
    end
    cgpercent = cgcount / length(seq) * 100
    return cgpercent
end

#cgcontent("""""")