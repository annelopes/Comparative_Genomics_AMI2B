#!/bin/bash


# Generates a blastp database for each protein file (fasta format) contained in the directory [path_to_prot_file]
# The database is created in the [path_to_db] directory

# to run:
# bash blast_db_creation.sh


##### PARAMETERS #####

path_to_db=./Blast_db/
path_to_prot_file=./prot/

##### END PARAMETERS #

##### MAIN #####

if [ ! -d $path_to_db ]; then
        mkdir $path_db
fi

for species in $path_to_prot_file*
do
        temp=${species/*\//}
        ./ncbi-blast-2.10.1+/bin/makeblastdb -in $path_to_prot_file$temp -dbtype "prot" -out $path_to_db${temp/.fa*/}
        echo ""
done

##### END MAIN #