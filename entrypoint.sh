#!/bin/bash

# Done so that we can make servermess.sh run in the background and allow us to 
# free up and utilize the terminal for other purposes

nohup /home/bigBrother/cronjob_setter.sh &
exec /bin/bash
cd home/bigBrother