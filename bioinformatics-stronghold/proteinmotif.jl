using Pkg
Pkg.add("Requests")
using Requests

"""
Finding a Protein Motif

    proteinmotif(ids::Array) -> 

# Arguments
- `ids::Array`: at most 15 UniProt Protein Database access IDs.

# Return
- 

 For each protein possessing the N-glycosylation motif, output its given access ID followed by a list of locations in the protein string where the motif can be found.
"""
function proteinmotif(ids::Array)
    url = "https://www.uniprot.org/uniprot/"
    for id in ids
        res = get(url * id * ".fasta")
    return res
end

ids = ["A2Z669"]

print(proteinmotifs(ids))