
# 1. Loop to run CLAM 1.2.0 realigner over STAR alignments in the current folder


  for file in *.bam; do

    file_prefix=${file%.bam}
    mkdir $file_prefix


    #CLAM Re-aligner with a 100 bp window for RIP
    CLAM realigner -i $file -o $file_prefix --read-tagger-method median --retag --strandness opposite --winsize 100 --max-tags -1

  done #Close FOR loop running CLAM realigner.

-----------------------------------------------------------------------------------------
#2. CLAM 1.2.0 peakcaller using unique alignments processed from CLAM realigner


  # Cytosol data peaks
  CLAM peakcaller -i /Users/juanb/Desktop/hnrnpa1_RIP/cytoplasmic/STAR_alignments/HEK293_cytosol_1_hnRNPA1_061119_S2__Aligned.sortedByCoord.out/unique.sorted.bam,/Users/juanb/Desktop/hnrnpa1_RIP/cytoplasmic/STAR_alignments/HEK293_cytosol_2_hnRNPA1_061119_S4__Aligned.sortedByCoord.out/unique.sorted.bam,/Users/juanb/Desktop/hnrnpa1_RIP/cytoplasmic/STAR_alignments/HEK293_cytosol_3_hnRNPA1_060419_S9__Aligned.sortedByCoord.out/unique.sorted.bam,/Users/juanb/Desktop/hnrnpa1_RIP/cytoplasmic/STAR_alignments/HEK293_cytosol_4_hnRNPA1_060419_S11__Aligned.sortedByCoord.out/unique.sorted.bam -c /Users/juanb/Desktop/hnrnpa1_RIP/cytoplasmic/STAR_alignments/HEK293_cytosol_1_msIgG_061119_S1__Aligned.sortedByCoord.out/unique.sorted.bam,/Users/juanb/Desktop/hnrnpa1_RIP/cytoplasmic/STAR_alignments/HEK293_cytosol_2_msIgG_061119_S3__Aligned.sortedByCoord.out/unique.sorted.bam,/Users/juanb/Desktop/hnrnpa1_RIP/cytoplasmic/STAR_alignments/HEK293_cytosol_3_msIgG_060419_S8__Aligned.sortedByCoord.out/unique.sorted.bam,/Users/juanb/Desktop/hnrnpa1_RIP/cytoplasmic/STAR_alignments/HEK293_cytosol_4_msIgG_060419_S10__Aligned.sortedByCoord.out/unique.sorted.bam -o /Users/juanb/Desktop/hnrnpa1_RIP/cytoplasmic/STAR_alignments/CLAM_peaks --binsize 500 --gtf /Users/juanb/Desktop/hnrnpa1_RIP/gencode.v30.annotation.gtf -p 6 --qval-cutoff 0.05 -u

  # Mitochondrial data peaks
  CLAM peakcaller -i /Users/juanb/Desktop/hnrnpa1_RIP/mitochondrial/STAR_alignments/HEK293_mitochondria_1_hnRNPA1_061119_S5__Aligned.sortedByCoord.out/unique.sorted.bam,/Users/juanb/Desktop/hnrnpa1_RIP/mitochondrial/STAR_alignments/HEK293_mitochondria_2_hnRNPA1_061119_S7__Aligned.sortedByCoord.out/unique.sorted.bam,/Users/juanb/Desktop/hnrnpa1_RIP/mitochondrial/STAR_alignments/HEK293_mitochondria_3_hnRNPA1_060419_S13__Aligned.sortedByCoord.out/unique.sorted.bam,/Users/juanb/Desktop/hnrnpa1_RIP/mitochondrial/STAR_alignments/HEK293_mitochondria_4_hnRNPA1_060419_S15__Aligned.sortedByCoord.out/unique.sorted.bam -c /Users/juanb/Desktop/hnrnpa1_RIP/mitochondrial/STAR_alignments/HEK293_mitochondria_2_msIgG_061119_S6__Aligned.sortedByCoord.out/unique.sorted.bam,/Users/juanb/Desktop/hnrnpa1_RIP/mitochondrial/STAR_alignments/HEK293_mitochondria_3_msIgG_060419_S12__Aligned.sortedByCoord.out/unique.sorted.bam,/Users/juanb/Desktop/hnrnpa1_RIP/mitochondrial/STAR_alignments/HEK293_mitochondria_4_msIgG_060419_S14__Aligned.sortedByCoord.out/unique.sorted.bam -o /Users/juanb/Desktop/hnrnpa1_RIP/mitochondrial//STAR_alignments/CLAM_peaks --binsize 500 --gtf /Users/juanb/Desktop/hnrnpa1_RIP/gencode.v30.annotation.gtf -p 6 --qval-cutoff 0.05 -u

  # Whole cell data peaks
  CLAM peakcaller -i /Users/juanb/Desktop/hnrnpa1_RIP/whole_cell/STAR_alignments/HEK293_total_1_hnRNPA1_052119_S17__Aligned.sortedByCoord.out/unique.sorted.bam,/Users/juanb/Desktop/hnrnpa1_RIP/whole_cell/STAR_alignments/HEK293_total_2_hnRNPA1_052119_S19__Aligned.sortedByCoord.out/unique.sorted.bam,/Users/juanb/Desktop/hnrnpa1_RIP/whole_cell/STAR_alignments/HEK293_total_3_hnRNPA1_052119_S21__Aligned.sortedByCoord.out/unique.sorted.bam -c /Users/juanb/Desktop/hnrnpa1_RIP/whole_cell/STAR_alignments/HEK293_total_1_msIgG_052119_S16__Aligned.sortedByCoord.out/unique.sorted.bam,/Users/juanb/Desktop/hnrnpa1_RIP/whole_cell/STAR_alignments/HEK293_total_2_msIgG_052119_S18__Aligned.sortedByCoord.out/unique.sorted.bam,/Users/juanb/Desktop/hnrnpa1_RIP/whole_cell/STAR_alignments/HEK293_total_3_msIgG_052119_S20__Aligned.sortedByCoord.out/unique.sorted.bam -o /Users/juanb/Desktop/hnrnpa1_RIP/whole_cell/STAR_alignments/CLAM_peaks --binsize 500 --gtf /Users/juanb/Desktop/hnrnpa1_RIP/gencode.v30.annotation.gtf -p 6 --qval-cutoff 0.05 -u

-----------------------------------------------------------------------------------------
#3. HOMER v4.11.1 de novo motifs using the peaks called with CLAM


  # Motifs called using cytosolic peaks
  findMotifsGenome.pl /Users/juanb/Desktop/hnrnpa1_RIP/cytoplasmic/STAR_alignments/CLAM_peaks/narrow_peak.unique.bed hg38 /Users/juanb/Desktop/hnrnpa1_RIP/cytoplasmic/STAR_alignments/CLAM_peaks/peak_sequence_motifs -rna -len 4,5,6,7,8 -p 3 -size 500 -S 10

  # Motifs called using mitochondrial peaks
  findMotifsGenome.pl /Users/juanb/Desktop/hnrnpa1_RIP/mitochondrial//STAR_alignments/CLAM_peaks/narrow_peak.unique.bed hg38 /Users/juanb/Desktop/hnrnpa1_RIP/mitochondrial//STAR_alignments/CLAM_peaks/peak_sequence_motifs -rna -len 4,5,6,7,8 -p 3 -size 500 -S 10

  # Motifs called using whole cell peaks
  findMotifsGenome.pl /Users/juanb/Desktop/hnrnpa1_RIP/whole_cell/STAR_alignments/CLAM_peaks/narrow_peak.unique.bed hg38 /Users/juanb/Desktop/hnrnpa1_RIP/whole_cell/STAR_alignments/CLAM_peaks/peak_sequence_motifs -rna -len 4,5,6,7,8 -p 3 -size 500 -S 10

-----------------------------------------------------------------------------------------
#4. HOMER v4.11.1 de calculate read density ratios


# Make "tag directory" for each hnRNPA1 and IgG group

  # Cytosol
  makeTagDirectory cytosol_hnrnpa1_tag/ HEK293_cytosol_1_hnRNPA1_061119_S2__Aligned.sortedByCoord.out.bam HEK293_cytosol_2_hnRNPA1_061119_S4__Aligned.sortedByCoord.out.bam HEK293_cytosol_3_hnRNPA1_060419_S9__Aligned.sortedByCoord.out.bam HEK293_cytosol_4_hnRNPA1_060419_S11__Aligned.sortedByCoord.out.bam -flip -sspe -unique
  makeTagDirectory cytosol_IgG_tag/ HEK293_cytosol_1_msIgG_061119_S1__Aligned.sortedByCoord.out.bam HEK293_cytosol_2_msIgG_061119_S3__Aligned.sortedByCoord.out.bam HEK293_cytosol_3_msIgG_060419_S8__Aligned.sortedByCoord.out.bam HEK293_cytosol_4_msIgG_060419_S10__Aligned.sortedByCoord.out.bam -flip -sspe -unique

  # Mitochondrial
  makeTagDirectory mito_hnrnpa1_tag/ HEK293_mitochondria_1_hnRNPA1_061119_S5__Aligned.sortedByCoord.out.bam HEK293_mitochondria_2_hnRNPA1_061119_S7__Aligned.sortedByCoord.out.bam HEK293_mitochondria_3_hnRNPA1_060419_S13__Aligned.sortedByCoord.out.bam HEK293_mitochondria_4_hnRNPA1_060419_S15__Aligned.sortedByCoord.out.bam -flip -sspe -unique
  makeTagDirectory mito_IgG_tag/ HEK293_mitochondria_2_msIgG_061119_S6__Aligned.sortedByCoord.out.bam HEK293_mitochondria_3_msIgG_060419_S12__Aligned.sortedByCoord.out.bam HEK293_mitochondria_4_msIgG_060419_S14__Aligned.sortedByCoord.out.bam -flip -sspe -unique

  # Whole cell
  makeTagDirectory wholecell_hnrnpa1_tag/ HEK293_total_1_hnRNPA1_052119_S17__Aligned.sortedByCoord.out.bam HEK293_total_2_hnRNPA1_052119_S19__Aligned.sortedByCoord.out.bam HEK293_total_3_hnRNPA1_052119_S21__Aligned.sortedByCoord.out.bam -flip -sspe -unique
  makeTagDirectory wholecell_IgG_tag/ HEK293_total_1_msIgG_052119_S16__Aligned.sortedByCoord.out.bam HEK293_total_2_msIgG_052119_S18__Aligned.sortedByCoord.out.bam HEK293_total_3_msIgG_052119_S20__Aligned.sortedByCoord.out.bam -flip -sspe -unique


# Calculate read density ratios on each strand

  # Cytosol
  makeUCSCfile cytosol_hnrnpa1_tag/ -i cytosol_IgG_tag/ -strand + -o auto
  makeUCSCfile cytosol_hnrnpa1_tag/ -i cytosol_IgG_tag/ -strand - -o auto

  # Mitochondrial
  makeUCSCfile mito_hnrnpa1_tag -i mito_IgG_tag -strand + -o auto
  makeUCSCfile mito_hnrnpa1_tag -i mito_IgG_tag -strand - -o auto

  # Whole cell
  makeUCSCfile wholecell_hnrnpa1_tag -i wholecell_IgG_tag -strand + -o auto
  makeUCSCfile wholecell_hnrnpa1_tag -i wholecell_IgG_tag -strand - -o auto
