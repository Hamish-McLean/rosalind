"""
Read FASTA format

    readfasta(fastafilename::String) -> Dict

Parse fasta into a dictionary format.

# Arguments
- `fastafilename::String`: The name of a fasta text file.

# Returns
- `Dict{String, String}`: a dictionary of Name => sequence.
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