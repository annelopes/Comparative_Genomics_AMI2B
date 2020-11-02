

## 1 Organize your working directory (wd)

BLAST
* download the BLAST programs here: https://ftp.ncbi.nlm.nih.gov/blast/executables/blast+/LATEST/
* untar your file with

```tar -zxvf ncbi-blast-2.10.1+-x64-macosx.tar.gz ```
* if necessary, modify the permissions of BLAST programs stored in wd/ncbi-blast-2.10.1+/bin/ with

```chmod +x  wd/ncbi-blast-2.10.1+/bin/*```

DATA

* download the prot.tar file which contains all fasta files (CDS - aminoacids)
* untar your file with

```tar -xvf prot.tar ```

* create the dir for BLAST db with

``` mkdir Blast_db```

## 2 Example with two species: 

* create a BLAST db for the genome of Shigella_sonnei_ss046.fa (i.e. the target or subject) 

```./ncbi-blast-2.10.1+/bin/makeblastdb -in prot/Shigella_sonnei_ss046.fa -dbtype "prot" -out Blast_db/Shigella_sonnei_ss046 ```

BLAST has produced a small database for the input genome which is stored in wd/Blast_db (see *.phr, *.psq...)


* run the all VS all BLAST (all genes from G1 VS all genes from G2) with the following command line and wait a bit... Maybe, take a coffee :) Hum, maybe 2 or 3...

```
./ncbi-blast-2.10.1+/bin/blastp -query prot/Escherichia_coli_536.fa -db Blast_db/Shigella_sonnei_ss046 -out coli536_VS_iai1  -num_threads 2 -outfmt '7 qseqid sseqid pident length mismatch gapopen qstart qend sstart send evalue bitscore qlen slen gaps' 
```

  * caution!!! The query corresponds to the sequence we want to scan (i.e. the sequence for which we are looking for homologs in the target genome or DB (i.e. nr, pdb, swissprot...)
   The query always consists of a fasta file containing one ore more sequences (i.e. a complete genome) - please indicate the complete path of the file including the file extension (i.e. .fa, .fasta. .txt...).
   The target corresponds to the db we want to screen (i.e. a genome or any DB built with makeblastdb). Indicate the complete path but do not write the file extensions! 
   

## 3 Applying on all genomes

* first, create the BLAST db for every genome. Therefore, run the script blast_db_creation.sh (modify the permission if necessary)

```
./blast_db_creation.sh

```

  * all the DB will be stored in Blast_db
  
  * run all the blast (all VS all) with the following command line. Do not hesitate to modify the output format or nb of threads depending on your computer facilities
  
  ```
  ./launch_blast.sh 
  
  ```
  
  
  
  
