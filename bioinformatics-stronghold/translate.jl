"""
Translating RNA into Protein

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
    for triplet in 1:3:(length(s)-3)
        translation *= get(codons, SubString(s, triplet, triplet+2), Nothing)
    end
    println(translation)
end

"""
filename = "rosalind_prot.txt"

rna = open(filename) do file
    read(file, String)
end

translate(rna)
"""