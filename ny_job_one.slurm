#!/bin/bash
#
#SBATCH --job-name=ny-job1
#SBATCH --output=ny_job1_output_extended_m_five.txt
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
python parallel_wrapper.py -j NewYorkJobOne -g ./src/data/nyPrecinctNeighborsN.json -s NewYork -d NewYorkJobOne -c 40 -a 1500 -r 16000 -m 0.05
