#!/bin/bash

LOG_FILE = "/var/log/dummy-service.log"

touch "$LOG_FILE"

while true; do
    echo "$(date) Dummy service is running..." >> "$LOG_FILE"
    sleep 10
done
