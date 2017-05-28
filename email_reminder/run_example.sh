#!/bin/bash

""" IMPORTANT: RENAME this file to run.sh """

# Set Environment Variables
export KC_GMAIL_USERNAME="MY GMAIL USERNAME"
export BG93_GMAIL_USERNAME="MY SECONDARY GMAIL USERNAME"
export BG93_GMAIL_PASSWORD="MY SECONDARY GMAIL PASSWORD"

LOG_FILE="/var/log/email_reminder.log"
SCRIPT_PATH="/home/zabana/projects/Ralph/email_reminder/run.sh"

# If /var/log/email_reminder.log does not exist
# create the file and chmod 666 it

if [[ ! -f "$LOG_FILE" ]]; then
    echo "[log] $LOG_FILE does not exist. Creating it ..."
    sudo touch "$LOG_FILE"
    sudo chmod 666 "$LOG_FILE"
    echo "[log] File created."
fi

# Add script to the user's crontab
# It will be scheduled to run every month on the 28th at 9:30 AM
echo "[log] Appending script to crontab"
(crontab -l ; echo "30 9 28 * * $SCRIPT_PATH")| crontab -
echo "[log] Done"

# Run the script
echo "[log] Running script ..."
python email_reminder.py
