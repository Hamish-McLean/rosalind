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
        seq_cat = join(seq[2:length(seq)])
        sequences[seq[1]] = seq_cat
    end
    return sequences
end


"""
Computing GC Percent 

    cg_percent(seq)

Returns the CG percent of a given sequence.
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

    cg_content(fasta)

Calculates CG percentage of sequences in FASTA format and returns the name and CG percentage of the sequence with the highest CG content.
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

#cg_content("""""")