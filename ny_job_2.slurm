#!/bin/bash
#
#SBATCH --job-name=ny-job2
#SBATCH --output=ny_output_extended_m_ten.txt
#SBATCH --ntasks-per-node=28
#SBATCH --nodes=1
#SBATCH --time=48:00:00
#SBATCH -p extended-28core
#SBATCH --mail-type=BEGIN,END
#SBATCH --mail-user=edwin.ma.1@stonybrook.edu

module load gnu-parallel/6.0
module load anaconda/3

cd /gpfs/projects/CSE416/leMonke/gerrymandering-mcmc-master/
pip install -r requirements.txt
parallel --verbose --jobs 28 -N0 "python cli.py -g ./src/data/nyPrecinctNeighborsN.json -s NewYork -d JobTwo -c 2000 -r 200 -m 0.05 -v" ::: {1..28}
