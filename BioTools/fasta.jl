export readfasta, readfastastrings


"""
    readfasta(fastafilename::String) -> Dict

Parse fasta into a dictionary format.

# Arguments
- `fastafilename::String`: The name of a fasta text file.

# Returns
- `Dict{String, String}`: a dictionary of Name => sequence.
"""
function readfasta(fastafilename::String)
    fastastring = open(fastafilename) do file
        read(file, String)
    end
    sequences = Dict{String, String}()
    seqstrings = split(fastastring, '>')
    popfirst!(seqstrings)
    for i in seqstrings
        i = replace(i, "\r\n" => "\n")
        seq = split(i, "\n")
        seqcat = join(seq[2:length(seq)])
        sequences[seq[1]] = seqcat
    end
    return sequences
end


"""
    readfastastrings(fastafilename::String) -> Array

Parse fasta into an array of strings.

# Arguments
- `fastafilename::String`: The name of a fasta text file.

# Returns
- `Array`: an array of strings from the fasta file.
"""
function readfastastrings(fastafilename::String)
    fastastring = open(fastafilename) do file
        read(file, String)
    end
    sequences = []
    seqstrings = split(fastastring, '>')
    popfirst!(seqstrings)
    for i in seqstrings
        i = replace(i, "\r\n" => "\n")
        seq = split(i, "\n")
        seqcat = join(seq[2:length(seq)])
        push!(sequences, seqcat)
    end
    return sequences
end