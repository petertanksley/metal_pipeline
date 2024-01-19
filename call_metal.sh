#!/bin/bash
#SBATCH -J tt_pgs         # Job name
#SBATCH -o tt_pgs.o%j     # Name of stdout output file
#SBATCH -N 1		  # Total # of nodes (must be 1 for serial)
#SBATCH -n 1		  # Total # of mpi tasks (should be 1 for serial)
#SBATCH -p development   	  # Queue (partition) name
#SBATCH -t 00:30:00	  # Run time (hh:mm:ss)
#SBATCH -A OTH21060	  # Project/Allocation name (req'd if you have more than 1)
#SBATCH --mail-type=all   # Send email at begin and end of job
#SBATCH --mail-user=peter.tanksley@austin.utexas.edu


#========================================================================================#
# SET WORKING ENVIRONMENT
#========================================================================================#

export PATH=$PATH:/work/07624/tankslpr/ls6/TOOLS
export PATH=$PATH:/work/07624/tankslpr/ls6/TOOLS/generic-metal

#SET UP OUTPUT DIRECTORIES
mkdir -p ../output
mkdir -p ../temp


#========================================================================================#
# OPERATIONS
#========================================================================================#

#=AFR SUMSTATS===============

#=SMOK

# CHECK IF THE OUTPUT FILE EXISTS
if [ ! -e ../output/CLEANED.afr_smok_23all_public_metal1.tbl ]; then

#CALL METAL AND PROVIDE SCRIPT WITH COMMANDS
metal metal_commands_SMOK_afr.sh

fi


#=EUR SUMSTATS===============

#=ALCP

# CHECK IF THE FILE EXISTS
if [ ! -e ../output/CLEANED.eur_alcp_ukb_metal1.tbl ]; then

metal metal_commands_ALCP_eur.sh

fi

# CHECK IF THE FILE EXISTS
if [ ! -e ../output/CLEANED.eur_smok_23all_public_ukb_metal1.tbl ]; then

#CALL METAL AND PROVIDE SCRIPT WITH COMMANDS
metal metal_commands_SMOK_eur.sh

fi
