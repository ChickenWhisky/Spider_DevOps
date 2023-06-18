#!/bin/bash

# Sets the cronjob to do the task everyday task at 1800(6:00 PM)

cron_exp="0 18 * * * /path/to/your/script.sh"
(crontab -l 2>/dev/null; echo "$cron_exp") | crontab -
