import json
import os
import argparse

def main():
    # parse all of the args into os
    arg_parser = argparse.ArgumentParser(description='')
    arg_parser.add_argument('-j', '--job_name')
    arg_parser.add_argument('-g', '--state_file')
    arg_parser.add_argument('-s', '--state_name')
    arg_parser.add_argument('-d', '--directory')
    arg_parser.add_argument('-c', '--cores')
    arg_parser.add_argument('-a', '--cooling')
    arg_parser.add_argument('-r', '--runs')
    arg_parser.add_argument("-m", "--max_pop")

    args = arg_parser.parse_args()

    job_name = args.job_name
    cores = args.cores 
    state_file = args.state_file
    directory = args.directory 
    cooling = args.cooling
    runs = args.runs
    rounds = int(int(args.runs)/int(args.cores))
    state_name = args.state_name
    max_pop = args.max_pop

    if not os.path.exists("output/"+ state_name + "/" + directory +"/"):
        os.makedirs("output/"+ state_name + "/" + directory +"/")


    job_info = {
        "job_name" : job_name,
        "state_name" : state_name,
        "cooling" : cooling,
        "rounds" : rounds,
        "runs" : runs,
        "max_pop_diff_percentage" : max_pop
    }
    with open("output/"+ state_name + "/" + directory + "/job_info.json", 'w') as file:
        file.write(json.dumps(job_info))

    os.system('parallel --verbose --jobs ' + cores + ' -N0 "python cli.py -g '+ state_file +' -s '+ state_name + ' -d '+ directory + ' -c ' + cooling + ' -r ' + str(rounds) + ' -m ' + max_pop + '" ::: {1..' + cores + '}') 


if __name__ == "__main__":
    main()
