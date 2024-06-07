CRON_JOB="* * * * * /home/hadoop/data_loader_using_hdfs_hive/wrapper.sh"
(crontab -l; "$CRON_JOB") | crontab -