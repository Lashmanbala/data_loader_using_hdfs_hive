CRON_JOB="*/2 * * * * /home/hadoop/hive_app/wrapper.sh"
(crontab -l 2>/dev/null; echo "$CRON_JOB") | crontab -