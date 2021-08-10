Trinity --seqType fq --left HEK293_cytosol_POOLED_hnRNPA1_RIP_R1.fastq.gz --right HEK293_cytosol_POOLED_hnRNPA1_RIP_R2.fastq.gz  --CPU 4 --output HEK293_cytosol_POOLED_hnRNPA1_RIP_trinity --max_memory 30G --no_salmon
Trinity --seqType fq --left HEK293_mitochondria_POOLED_hnRNPA1_RIP_R1.fastq.gz --right HEK293_mitochondria_POOLED_hnRNPA1_RIP_R2.fastq.gz --CPU 4 --output HEK293_mitochondria_POOLED_hnRNPA1_RIP_trinity --max_memory 30G --no_salmon
Trinity --seqType fq --left HEK293_total_POOLED_hnRNPA1_RIP_R1.fastq.gz --right HEK293_total_POOLED_hnRNPA1_RIP_R2.fastq.gz --CPU 4 --output HEK293_total_POOLED_trinity --max_memory 30G --no_salmon

