"""
Given: At most 15 UniProt Protein Database access IDs.

Return: For each protein possessing the N-glycosylation motif, N{P}[ST]{P} ({X} = not X, [XY] = X or Y), output its given access ID followed by a list of locations in the protein string where the motif can be found.
"""

import requests

def protein_motif(ids):
    hits = {}
    motifs = read_uniprot(ids)
    for id, seq in motifs.items():
        index = n_glyc_match(seq)
        if index:
            hits[id] = index
    return hits


def n_glyc_match(seq):
    hits = []
    for i in range(len(seq)-3):
        if seq[i] != 'N': continue
        elif seq[i+1] == 'P': continue
        elif seq[i+2] != 'S' and seq[i+2] != 'T': continue
        elif seq[i+3] == 'P': continue
        else: hits.append(i+1)
    return hits


def read_uniprot(ids):
    """Search for a list of uniprot ids and return as a fasta dictionary.
    """
    url = "http://www.uniprot.org/uniprot/"
    motifs = {}
    for id in ids:
        fasta = requests.get(url+id+".fasta").text.splitlines()
        if fasta[0][0] == ">":
            fasta = fasta[1:]
        motifs[id] = ''.join(fasta)
    return motifs


#ids = ["A2Z669", "B5ZC00", "P07204_TRBM_HUMAN", "P20840_SAG1_YEAST"]

ids = [
    "Q6A9W5",
    "Q13VE3",
    "P29460_I12B_HUMAN",
    "Q05557",
    "Q66GC7",
    "P01047_KNL2_BOVIN",
    "Q640N1",
    "A6UDH9",
    "P00749_UROK_HUMAN",
    "A6LJ74",
    "P01588_EPO_HUMAN",
    "P02186"
]


hits = protein_motif(ids)
for id, index in hits.items():
    print(id)
    print(*index, sep=" ")