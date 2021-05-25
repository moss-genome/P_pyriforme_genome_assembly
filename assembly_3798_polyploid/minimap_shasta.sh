#!/bin/bash
#SBATCH --job-name=minimap_shasta_ppyriforme
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 8
#SBATCH --partition=general
#SBATCH --qos=general
#SBATCH --mail-type=END
#SBATCH --mem=40G
#SBATCH --mail-user=vidya.vuruputoor@uconn.edu
#SBATCH -o %x_%j.out
#SBATCH -e %x_%j.err

module load minimap2/2.17
module load samtools

org=/projects/EBP/Wegrzyn/Moss/ppyriforme/assembly
ref=/centrifuge/abv_fungi_unclassified_reads_from_centrifuge/ppyriforme_unclassified_reads_prometh_only.fastq
ref1=/data/2020NOV11_Goffinet_3798A_PAG01750/fastq_pass/PAG01750_pass_2e5a7426_all.fastq
ref2=/centrifuge/add_flongle_runs/2020OCT14_Goffinet_Pp-3798A_flgle_AEU090/2020OCT14_Goffinet_Pp-3798A_flgle_AEU090/20201014_1322_MN17935_AEU090_d5009bfd/fastq_pass/3798_flongle_all.fastq
query=/shasta/Shasta_run_minlen_10k/ShastaRun/Assembly.fasta

minimap2 -L -ax map-ont $org/$ref $org/$query > alignment_shasta_promethion.sam
#minimap2 -a $org/$ref1 $org/$query > alignment_shasta_promethion_raw.sam
#minimap2 -a $org/$ref2 $org/$query > alignment_shasta_flongle.sam

#samtools view -S -b alignment_shasta_promethion.sam > alignment_shasta_promethion.bam
#samtools view -S -b alignment_shasta_promethion_raw.sam > alignment_shasta_promethion_raw.bam
#samtools view -S -b alignment_shasta_flongle.sam > alignment_shasta_flongle.bam
