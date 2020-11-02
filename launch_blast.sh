#!/bin/bash


# This script executes all possible blastp for the given blast database [path_to_db] and protein file [path_to_prot_file] and writes the results ( [query file]-vs-[subject file].bl ) in a new directory [path_to_blast_out].
# output format : tabular file with the following column organization (see https://www.ncbi.nlm.nih.gov/books/NBK279684/): qseqid, sseqid, pident, length, mismatch, gapopen, qstart, qend, sstart, send, evalue, bitscore, qlen, slen, gaps
# 
# [path_to_db], [path_to_prot_file] and [path_to_prot_file] must be given by the user in the PARAMETERS section

# to run
# bash launch_blast.sh

##### PARAMETERS #####

path_to_db=./Blast_db/
path_to_prot_file=./prot/
path_to_blast_out=./Blast_output/

##### END PARAMETERS #

##### MAIN #####

if [ ! -d $path_to_blast_out ]; then
        mkdir $path_to_blast_out
fi

for set1 in $path_to_prot_file*
do
        temp=${set1/*\//}
        for set2 in $path_to_prot_file*
        do
                temp_set2=${set2/*\//}
                if [ ! $temp = $temp_set2 ]; then
                        out=$path_to_blast_out${temp/.fa*/}-vs-${temp_set2/.fa*/.bl}
                        db=$path_to_db${temp_set2/.fa*/}
                        echo "IN: "$set1
                        echo "DB: "$db
                        echo "OUT: "$out
                        echo "RUNNING BLAST..."
                        echo ""
                        ./ncbi-blast-2.10.1+/bin/blastp -query $set1 -db $db -out $out -num_threads 2 -outfmt '7 qseqid sseqid pident length mismatch gapopen qstart qend sstart send evalue bitscore qlen slen gaps'
                fi
        done
done

##### END MAIN #