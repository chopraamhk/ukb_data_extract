#!/bin/sh
#SBATCH --job-name="SparseGRM"
#SBATCH --mail-user=<>
#SBATCH -o ld_prune.o%j
#SBATCH -e ld_prune.e%j
#SBATCH -n 64
#SBATCH -N 4
#SBATCH --partition="normal"

# concatenate GRM parts
cat /data3/mchopra/ukb_genotype_mri_passed/output/GCTA/grm_prt.part_*.grm.id > /data3/mchopra/ukb_genotype_mri_passed/output/makesparseGRM/GRM.grm.id
cat /data3/mchopra/ukb_genotype_mri_passed/output/GCTA/grm_prt.part_*.grm.bin > /data3/mchopra/ukb_genotype_mri_passed/output/makesparseGRM/GRM.grm.bin
cat /data3/mchopra/ukb_genotype_mri_passed/output/GCTA/grm_prt.part_*.grm.N.bin > /data3/mchopra/ukb_genotype_mri_passed/output/makesparseGRM/GRM.grm.N.bin

# sparse GRM from SNP data
./gcta-1.94.1 --grm /data3/mchopra/ukb_genotype_mri_passed/output/makesparseGRM/GRM --make-bK-sparse 0.05 --threads 64 --out /data3/mchopra/ukb_genotype_mri_passed/output/makesparseGRM/sp_grm
