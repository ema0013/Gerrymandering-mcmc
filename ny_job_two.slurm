#!/bin/bash
#
#SBATCH --job-name=ny-job2
#SBATCH --output=ny_job2_output_extended_m_ten.txt
#SBATCH --ntasks-per-node=40
#SBATCH --nodes=1
#SBATCH --time=96:00:00
#SBATCH -p extended-40core
#SBATCH --mail-type=BEGIN,END
#SBATCH --mail-user=edwin.ma.1@stonybrook.edu

module load gnu-parallel/6.0
module load anaconda/3

cd /gpfs/projects/CSE416/leMonke/gerrymandering-mcmc-master/
pip install -r requirements.txt
python parallel_wrapper.py -j NewYorkJobOne -g ./src/data/nyPrecinctNeighborsN.json -s NewYork -d NewYorkJobOne -c 40 -a 1700 -r 20000 -m 0.1
