############################################################
                           README
############################################################

1. Scripts related to de novo transcriptome assembly (Trinity_analysis folder)
----------------------------------------------------------------------------------
     * concatenate_reps.sh: bash script for concatenating replicates prior to assembly.
     * run_trinity.sh: bash script to run Trinity de novo transcriptome assembly from the hnRNPA1 RIP-seq data
     * map_to_chrMT.sh: bash script with commands to run Trinity assembly to mitochondrial genome (regions overlapping HN were manually extracted from the result)
     	+ output file is "2020-07-01_HEK293_total_Trinity_map_to_hg38_MT.pslx"     
     	
     	
2. Scripts related to RIP peak calling and motif analysis (Peak_Analysis folder)
----------------------------------------------------------------------------------
	* map_with_star.sh: script for STAR mapping to hg38 build
	* hnRNPA1_RIPseq_CLAM_Code.sh: code for CLAM analysis and HOMER motif analysis on result
     	