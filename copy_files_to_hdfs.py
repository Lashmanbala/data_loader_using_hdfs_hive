import subprocess
import glob
import os

subprocess.check_call(
    'hdfs dfs -mkdir -p /user/`whoami`/data',
    shell=True
)

path='data'

cmd_template = 'hdfs dfs -put {src_dir} /user/`whoami`/data/{tgt_dir}'

for item in glob.glob(f'{path}/*'):
    cmd = cmd_template.format(src_dir=item, tgt_dir=os.path.split(item)[1])
    print(f'copying {os.path.split(item)[1]} to hdfs')
    #print(cmd)
    subprocess.check_call(cmd, shell=True)