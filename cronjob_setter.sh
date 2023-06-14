#!/bin/bash

cron_exp="0 18 * * * /path/to/your/script.sh"
(crontab -l 2>/dev/null; echo "$cron_exp") | crontab -
