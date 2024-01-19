#==================================================================================

# THIS SCRIPT EXECUTES A META-ANALYSIS OF PUBLIC/PRIVATE SUMSTATS  FOR
# SMOKING INITIATION (SMOK) FROM SAUNDERS ET AL. 2022 (GSCAN2) USING THE
# SOFTWARE APPLICATION METAL

# THE ANALYSIS WILL PROCEED IN TWO STEPS. FIRST, THE SEX STRATIFIED SUMSTATS
# FROM 23andMe WILL BE META-ANALYZED. SECOND, THE PUBLICLY AVAILABLE SUMSTATS
# (NON-STRATIFIED) WILL BE META-ANALYZED WITH THOSE FROM 23andMe.

# SMOK SUMMARY STATISTICS:
# 23andMe (FEMALES): ../input/AFR/SMOK/CLEANED.afr_smok_23f.gz
# 23andMe (MALES): ../input/AFR/SMOK/CLEANED.afr_smok_23f.gz
# PUBLIC (MALES/FEMALES): ../input/AFR/SMOK/CLEANED.afr_smok_pub.gz

# UNCOMMENT THE NEXT LINE TO ENABLE GenomicControl CORRECTION
# GENOMICCONTROL ON

#SAMPLE-SIZE WEIGHTED META-ANALYSIS OR...
SCHEME SAMPLESIZE

#INVERSE-VARIANCE WEIGHTED META-ANALYSIS
#SCHEME STDERR

# To help identify allele flips, it can be useful to track
# allele frequencies in the meta-analysis. To enable this
# capability, uncomment the following two lines.
AVERAGEFREQ ON
MINMAXFREQ ON

#==================================================================================

# STEP 1: LOAD THE 23andMe INPUT FILES AND META-ANALYZE

# === DESCRIBE AND PROCESS 23andMe SMOK SUMSTATS (FEMALES) ===
MARKER SNP
ALLELE EFFECT_ALLELE OTHER_ALLELE
FREQ EAF
EFFECT BETA
STDERR SE
PVALUE PVAL
WEIGHT Neff
SEPARATOR TAB
PROCESS ../input/AFR/SMOK/CLEANED.afr_smok_23f.gz
PROCESS ../input/AFR/SMOK/CLEANED.afr_smok_23m.gz
PROCESS ../input/AFR/SMOK/CLEANED.afr_smok_pub.gz

# === META-ANALYSIS OF 23andMe DATA WITH PUBLIC DATA (FULL SAMPLE)
OUTFILE ../output/CLEANED.afr_smok_23all_public_metal .tbl
ANALYZE HETEROGENEITY

QUIT
