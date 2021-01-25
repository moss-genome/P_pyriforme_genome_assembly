# **_P. pyriforme_ genome assembly**

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

