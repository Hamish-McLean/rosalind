export complement, motifsearch, transcribe, translate


"""
    complement(s::String) -> String

# Arguments
- `s::String`: a DNA string

# Return
- `String`: the reverse complement `sc` of `s`.
"""
function complement(s::String)
    pairs = Dict('A' => 'T', 'T' => 'A', 'C' => 'G', 'G' => 'C')
    sc = ""
    for base in reverse(s)
        sc *= pairs[base]
    end
    return sc
end 


"""
    motifsearch(s::String, t::String) -> Array

Finds the locations of a `motif` in nucleotide sequence `s`.

# Arguments
- `motif::String`: a DNA string.
- `t::String`: a DNA string.

# Returns
- `Array`: all locations of `motif` as a substring of `s`.
"""
function motifsearch(motif::String, s::String)
    locations = []
    for i in 1:length(s)-length(motif)+1
        if s[i:i+length(motif)-1] == motif
            push!(locations, i)
        end
    end
    return locations
end


"""
    transcribe(t::String) -> String

# Arguments
- `t::String`: a DNA string.

# Returns
- `String`: the transcribed string of `t`.
"""
transcribe(t::String) = replace(t, 'T' => 'U')


"""
    translate(s::String) -> String

Translates an RNA string into an amino acid string.

# Arguments
- `s::String`: an RNA string `s` corresponding to a strand of mRNA.

# Return
- `String`: The protein string encoded by `s`.
"""
function translate(s::String)
    translation = ""
    codons = Dict(
        "UUU"=>"F",    "CUU"=>"L", "AUU"=>"I", "GUU"=>"V",
        "UUC"=>"F",    "CUC"=>"L", "AUC"=>"I", "GUC"=>"V",
        "UUA"=>"L",    "CUA"=>"L", "AUA"=>"I", "GUA"=>"V",
        "UUG"=>"L",    "CUG"=>"L", "AUG"=>"M", "GUG"=>"V",
        "UCU"=>"S",    "CCU"=>"P", "ACU"=>"T", "GCU"=>"A",
        "UCC"=>"S",    "CCC"=>"P", "ACC"=>"T", "GCC"=>"A",
        "UCA"=>"S",    "CCA"=>"P", "ACA"=>"T", "GCA"=>"A",
        "UCG"=>"S",    "CCG"=>"P", "ACG"=>"T", "GCG"=>"A",
        "UAU"=>"Y",    "CAU"=>"H", "AAU"=>"N", "GAU"=>"D",
        "UAC"=>"Y",    "CAC"=>"H", "AAC"=>"N", "GAC"=>"D",
        "UAA"=>"Stop", "CAA"=>"Q", "AAA"=>"K", "GAA"=>"E",
        "UAG"=>"Stop", "CAG"=>"Q", "AAG"=>"K", "GAG"=>"E",
        "UGU"=>"C",    "CGU"=>"R", "AGU"=>"S", "GGU"=>"G",
        "UGC"=>"C",    "CGC"=>"R", "AGC"=>"S", "GGC"=>"G",
        "UGA"=>"Stop", "CGA"=>"R", "AGA"=>"R", "GGA"=>"G",
        "UGG"=>"W",    "CGG"=>"R", "AGG"=>"R", "GGG"=>"G"
    )
    for triplet in 1:3:(length(s)-2)
        translation *= get(
            codons, 
            SubString(s, triplet, triplet+2), 
            "*"
        )
    end
    return translation
end