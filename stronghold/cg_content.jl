"""
Read FASTA format

    read_fasta(fasta)

Returns a dictionary: Name => sequence.
"""
function read_fasta(fasta)
    sequences = Dict{String, String}()
    seq_strings = split(fasta, '>')
    popfirst!(seq_strings)
    for i in seq_strings
        seq = split(i, "\n")
        sequences[seq[1]] = seq[2]
    end
    return sequences
end


"""
Computing GC Percent 


"""
function cg_percent(seq)
    cg_count = 0
    for base in seq
        if base == 'C' || base == 'G'
            cg_count += 1
        end
    end
    cg_percent = cg_count / length(seq) * 100
    return cg_percent
end


"""
Computing GC Content

"""
function cg_content(fasta)
    sequences = read_fasta(fasta)
    cg_content = Dict{String, Float64}()
    for seq in sequences
        cg_content[seq[1]] = cg_percent(seq[2])
    end
    for i in cg_content
        println("$(i[1]): $(i[2]) %")
    end
    max_cg = findmax(cg_content)
    println("\n$(max_cg[2])\n$(max_cg[1])")
    return cg_content
end

cg_content(">ros\nACT\n>ros2\nAGGTC\n>ros\nATC")
