# **_P. pyriforme_ genome assembly**

## Sample Backround


14813 - Physcomitrium pyriforme 

Mansfield, CT     
Ploidy: Haploid   
Genome size: ?    
Data available: One flongle run yields >50% contamination. No full nanopore run     
Status: Re-submitted for library prep. Pending.


3798 - Physcomitriym pyriforme

Dare County, North Carolina   
Ploidy: diploid   
Heterozygosity: High heterozygosity - likely allopolyploid  
Genome size: ~500mb     
Data available: Flongle run and full nanopore run


5074 - Physcomitrellopsis africana

Ploidy: haploid   
Heterozygosity: low heterozygosity  
Data available: nanopore run 

# Proposal for Genome Assembly of _Physcomitrium pyriforme_

_Physcomitrium pyriforme_ genome assembly proposal
Polyploidy is the state of having entire multiples of a haploid set of chromosomes. We know that whole-genome duplication is ubiquitous across plants. Phylogenetic reconstructions show us that polyploids have arisen repeatedly in the past and produce genetic novelty which facilitates diversification (Doyle & Coate, 2019). Allopolyploids, the product of genome doubling following hybridization, present unique challenges to genomic study since they combine the genomes of two parental lineages. In angiosperms, genome studies largely focus on the dominant sporophytic life phase. The gametophytic phase of their life cycle is difficult to study in that it typically comprises only a few cells within the floral structure. In contrast, the bryophyte life cycle is haploid dominant. Mosses are thus amenable to studies focusing on the haploid phase. This project focuses on the moss genome of Physcomitrium pyriforme (Hedw.), which preliminary data from flow cytometry and phylogenomic analysis reveal to be an allopolyploid. This study system offers a unique perspective from which to observe allopolyploid plant genomes in general. It will be one of the first genome assemblies of an allopolyploid organism with a haploid dominant life form.
This project aims to compare the assembly quality produced by four genome assemblers, using long reads data produced from Promethion Oxford Nanopore. We predict that the size of our genome (500 Mb) and our use of long-read data will make our dataset more amenable to assembly using certain tools. We will implement the following assemblers: MaSuRCA, Flye, Shasta, and Velvet (Kolmogorov et al., 2019; Shafin et al., 2020; Zerbino, 2010; Zimin et al., 2013). Completeness will be measured with BUSCO (Benchmarking with Universally accepted Single Copy Orthologs) scores.  We hypothesize that MaSuRCA will generate the most complete assembly, as recent studies have shown it to be effective when assembling allopolyploid genomes from long-read nanopore sequences (Li et al., 2017; Zimin et al., 2013). We hypothesize that Flye will produce a comparably complete assembly because it leverages repeat graphs to more accurately assemble error-prone long reads (Kolmogorov et al., 2019).
	We will use QUAST (Gurevich et al., 2013) and BUSCO (Simão et al., 2015) to assess the results of each genome assembly by examining statistics including contig length, complete BUSCO genes, and duplicated BUSCO genes, N50, L50, and total alignment length. 

## Research Approach

We will be comparing different assemblers in how they would assemble a genome of around 500Mbp. The sequencing technology used for obtaining the reads for our genome is, Promethion, from Oxford Nanopore. The genome assembly process starts from assessing the quality of reads from the sequencing technology. Centrifuge (Kim et al., 2016), or Kraken (Wood & Salzberg, 2014) are both metagenomics analyzers that search for sequences that may be sourced from bacteria, fungi, or other species. There are options in the program to remove the contaminant reads to improve the quality of the sequenced reads. The use of BUSCO and QUAST is important to assess the quality of the reads, before and after any contaminant checks. BUSCO compares the reads to a set of universally accepted single-copy orthologs and gives an overall score of completeness, scores to estimate duplication and missing/fragmented genes (Simão et al., 2015). QUAST is a standalone tool that assesses an input FASTA file for generic statistics like N50, length of the sequence, number of reads, etc. Once the sequence is cleared of any contaminants, the next step is to assemble the genome (Gurevich et al., 2013). 

## Preliminary results

Centrifuge/Kraken results are in this spreadsheet: https://docs.google.com/spreadsheets/d/11go67Dql56dhhBo1JlUH7nulwTDp2iDw1IhnIql3CwQ/edit#gid=1318488447

**BUSCO scores after shasta run**: C:60.0%[S:46.8%,D:13.2%],F:7.1%,M:32.9%,n:425

**QUAST analysis**
| Statistic | Measurement |
| ---- | --- |
| Largest contig | 8400060 |
| Total length | 507570095 |
| GC (%) | 54.99 |
| N50  | 219561 |
| N75  38860 |
| L50 | 318 |
| L75  | 1876 |
| N's per 100 kbp | 0.00 |

And after medaka polishing: C:65.9%[S:51.5%,D:14.4%],F:5.2%,M:28.9%,n:425

## Updated Project Approach

Our approach changed after additional research and troubleshooting with the chosen assemblers. Masurca is most appropriate for hybrid assembly and our current datatset comprises only long reads. Similarly, further investigation of Velvet reveals that it is better suited for short read assembly. Instead of these assemblers, we implemented assembly using Canu and Redbean, which we selected based on benchmarking evidence that these assemblers fast and accurate for long read assembly (Koren et al. 2017; Ruan and Li 2019). The remainder of our analysis is based on these assemblers using the same QC approach proposed. 

Moving forward, we will augment our long read data with an additional run in order to improve depth of coverage. We will add short reads for error corrections. With the addition of these data, we plan to use hybrid assemblers originally proposed such as Masurca. 

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
