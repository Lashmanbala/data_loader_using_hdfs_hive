sh /home/hadoop/hive_app/wrapper.sh    # runs initially

CRON_JOB="*/3 * * * * /home/hadoop/hive_app/wrapper.sh"   # runs every 3 minutes

(crontab -l 2>/dev/null; echo "$CRON_JOB") | crontab -
