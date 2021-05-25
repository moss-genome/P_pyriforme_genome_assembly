#!/bin/bash
#SBATCH --job-name=wtdbg2_3798
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 20
#SBATCH --partition=himem	
#SBATCH --qos=himem
#SBATCH --mail-type=END
#SBATCH --mem=250G
#SBATCH --mail-user=nikisha.patel@uconn.edu
#SBATCH -o %x_%j.out
#SBATCH -e %x_%j.err

module load wtdbg2/2.5
module load samtools/1.9
module load minimap2/2.17

wtdbg2 -x ont -i /projects/EBP/Wegrzyn/Moss/ppyriforme/assembly/centrifuge/abv_fungi_unclassified_reads_from_centrifuge/ppyriforme_unclassified_reads_prometh_only.fastq -t 16 -fo dbg
wtpoa-cns -i dbg.ctg.lay.gz \
          -fo dbg.raw.fa -t 16
minimap2 -t16 -ax map-pb -r2k dbg.raw.fa /projects/EBP/Wegrzyn/Moss/ppyriforme/assembly/centrifuge/abv_fungi_unclassified_reads_from_centrifuge/ppyriforme_unclassified_reads_prometh_only.fastq | samtools sort -@4 >dbg.bam
samtools view -F0x900 dbg.bam | wtpoa-cns -t 16 -d dbg.raw.fa -i - -fo dbg.cns.fa






