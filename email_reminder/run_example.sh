#!/bin/bash

# Set Environment Variables
export KC_GMAIL_USERNAME="MY GMAIL USERNAME"
export BG93_GMAIL_USERNAME="MY SECONDARY GMAIL USERNAME"
export BG93_GMAIL_PASSWORD="MY SECONDARY GMAIL PASSWORD"

LOG_FILE="/var/log/email_reminder.log"

# If /var/log/email_reminder.log does not exist
# create the file and chmod 666 it

if [[ ! -f "$LOG_FILE" ]]; then
    echo "[log] $LOG_FILE does not exist. Creating it ..."
    sudo touch "$LOG_FILE"
    sudo chmod 666 "$LOG_FILE"
    echo "[log] File created."
fi

# Run the script
echo "[log] Running script ..."
python email_reminder.py
