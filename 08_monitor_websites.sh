#!/bin/bash
#######################################
# Script Name   : website_monitor.sh
# Author        : Vinayak Deokar
# Purpose       : Monitor websites/servers using ping and send email if any is down
#######################################

SITES=("google.com")

TO_EMAIL="your_email@example.com"
SUBJECT="Website Down Alert"

for SITE in "${SITES[@]}"; do
    if ping -c 1 -W 5 "$SITE" > /dev/null; then
        echo "Website $SITE is UP."
    else
        MESSAGE="ALERT: Website $SITE is DOWN!"
        echo "$MESSAGE" | mail -s "$SUBJECT" "$TO_EMAIL"
        echo "$MESSAGE"
    fi
done

