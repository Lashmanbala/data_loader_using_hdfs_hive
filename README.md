# Data Loader using HDFS and Hive

## Overview

This repository contains scripts and tools for efficiently loading data into Hadoop Distributed File System (HDFS) and Hive, tailored for use with AWS EMR 7.0.0, Hadoop 3.3.6, and Hive 3.1.3. It automates the data integration process, streamlining the workflow for managing large-scale data pipelines. The repository includes sample data, Hive query scripts, shell scripts for task scheduling, and a Python script to simulate upstream data processes, all designed to facilitate robust and scalable data management in a cloud environment.

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
