# **_P. pyriforme_ genome assembly**

## Sample Backround

14813 - Physcomitrium pyriforme 

Mansfield, CT. 
Ploidy: Haploid
Genome size: ?
Data available: One flongle run yields >50% contamination. No full nanopore run 
Status: Re-submitted for library prep. Pending.

3798 - Physcomitriym pyriforme

Dare County, North Carolina
North Carolina
Ploidy: diploid
Heterozygosity: High heterozygosity - likely allopolyploid
Genome size: ~500mb
Data available: Flongle run and full nanopore run





## Flongle run
Samples 14813 and 3798 were tested for contamination after a flongle run. 
1. Nanoplot was used to gather stats about the run
2. Quality check was done with Quast
3. Centrifuge was run against archae, bacteria and viruses, as well as the fungal databases to check the level of contamination in the flongle run. 

All stats recorded in this [spreadsheet](https://docs.google.com/spreadsheets/d/1cM6nhRrUKnQcvcTmS2nZ1lNUeYKa9WHmS3UbRELYxeI/edit#gid=0). 

Due to the amount of contamination, as well as the higher N50, sample 3798 was chosen for this genome assembly. 

## Shasta Assembly
The uncontaminated reads from the flongle run of 3798 and the runs from a Nanopore runs were chosen for shasta assembly. Quast was used to check the qualiy of the
assembly. 

Stats for the assembly are recorded [here](https://docs.google.com/spreadsheets/d/18px8Unlwzny7Mnu992Y85ujnlOxSAIqyKWWtMOivWUA/edit#gid=1918994077). 


## Flye Assembly

1) Flye (2.8.2) assembly error resulting from redundant seqids between data from the flongle and data from the full nanopore run .err file [here](https://docs.google.com/document/d/1cF2G2NrGqWMf4neIBEYE-MmylCmR69YF_sV-bjRwcjc/edit)

      A) Appended an 't' to the end of each seqid for data produced from flongle combined with full flongle run.              e.g   @b7cfd826-a42a-4a67-8d0d-3e72aadac842t  the file:   all_data_reps_removed3.fastq
      B) Re-ran Flye with the new data file using .sh file here: [here](https://docs.google.com/document/d/1bD28EzeCxZIHPJxicKXgiIAW5zqgEg6Jq_kWXfvc2Bk/edit)
      
2) Flye runs for ~24 hrs and ends because of memory. 
      A) Increased memory to 200G. Also the number of threads were in conflict so they were modified to be         consistent. .sh file [here](https://docs.google.com/document/d/15KVEgnsOwQNONehESThCVSKm_zJSeTSa6cMEwFSg544/edit)
      B) Flye runs but terminates after 22 hours and ends but does not appear to have completed. see folders run2 and run3

3) There is a possible error with the newest version of flye 2.8.2. Running Flye with oldest version of flye to test this. 
