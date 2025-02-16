# NYSE data ETL using Hive

## Overview

The requirement is to process the provided financial data in hive and store it as partitioned parquet files.
The data is NYSE financial data in csv format in zip files.
The data is periodically put into HDFS as a csv file.
A python script is developed to simulate the incoming data into hdfs.
A Hive script is developed to load the csv data into a staging table. And I read the data from the staging table and write into the parquet table with partitions.
I have developed a shell script to execute the hive script and capture the logs.
Using cron job the shell script is triggered in a regular interval.

## Contents

- **data/**: Directory containing sample data files.
- **.gitignore**: Specifies files and directories to be ignored by Git.
- **app.hql**: Hive query scripts for data processing.
- **app.log**: Log file for tracking the execution of scripts.
- **cron.sh**: Shell script for scheduling tasks using cron jobs.
- **upstream_simulation.py**: Python script for simulating upstream data processes.
- **wrapper.sh**: Wrapper script for executing the entire data loading process.

## Prerequisites

- AWS EMR 7.0.0
- Hadoop 3.3.6
- Hive 3.1.3
- Python 3.x
- Unix-like operating system

## Usage

1. **Setup HDFS and Hive:**
   Ensure HDFS and Hive are properly configured and running on AWS EMR.

2. **Data Preparation:**
   Place your data files in the `data/` directory.

3. **Execute Scripts:**
   Run the wrapper script to start the data loading process:
   ```bash
   sh wrapper.sh
   ```

4. **Scheduling with Cron:**
   Use cron.sh to schedule the data loading process
   Run the wrapper script to start the data loading process:
   ```bash
   sh run.sh
   ```

## Contact
For any questions, issues, or suggestions, please feel free to contact the project maintainer:

GitHub: [Lashmanbala](https://github.com/Lashmanbala)

LinkedIn: [Lashmanbala](https://www.linkedin.com/in/lashmanbala/)
