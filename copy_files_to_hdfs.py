import subprocess
import glob
import os

subprocess.check_call(
    'hdfs dfs -mkdir -p /user/`whoami`/nyse_data',
    shell=True
)

path='data'

cmd_template = 'hdfs dfs -put {src_dir} /user/`whoami`/nyse_data/{tgt_dir}'

for item in glob.glob(f'{path}/*'):
    try:
        print(f'unzipping {os.path.split(item)[1]}')
        subprocess.check_call(f'gunzip {item}', shell=True)

        file_name = os.path.split(item)[1][:-3]

        cmd = cmd_template.format(src_dir=item[:-3], tgt_dir=file_name)

        print(f'copying {os.path.split(item)[1]} to hdfs')
        subprocess.check_call(cmd, shell=True)
        
    except subprocess.CalledProcessError as e:
        print(f'failed to unzip {item} : {e}')