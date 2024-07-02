import subprocess
import glob
import os
import time


def upstream_simulator():
    hdfs_cmd_template = 'hdfs dfs -put {src_dir} /user/`whoami`/nyse_data/{tgt_dir}'

    for item in glob.glob('data/*'):
        try:
            subprocess.check_call(
                                'hdfs dfs -mkdir -p /user/`whoami`/nyse_data',
                                shell=True
                            )
            
            print(f'unzipping {os.path.split(item)[1]}')
            subprocess.check_call(f'gunzip {item}', shell=True)

            file_name = os.path.split(item)[1][:-3]

            hdfs_cmd = hdfs_cmd_template.format(src_dir=item[:-3], tgt_dir=file_name)

            print(f'copying {os.path.split(item)[1]} to hdfs')
            subprocess.check_call(hdfs_cmd, shell=True)

            time.sleep(180)   # delaying the process of next file by 3 minutes for simulation
            
        except subprocess.CalledProcessError as e:
            print(f'failed to unzip {item} : {e}')

if __name__ == "__main__":
    upstream_simulator()
