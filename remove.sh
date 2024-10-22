#!/bin/bash

#Replace {YOUR_SVC_NAME} with the actual service name you previously used.
SERVICE_NAME="{YOUR_SVC_NAME}" 
SERVICE_FILE="/etc/systemd/system/$SERVICE_NAME.service"

if [ -f "$SERVICE_FILE" ]; then
    sudo systemctl disable "$SERVICE_NAME.service"
    sudo systemctl stop "$SERVICE_NAME.service"
    sudo rm "$SERVICE_FILE"
    sudo systemctl daemon-reload
    echo "Success. The service $SERVICE_NAME has been removed from autorun."
else
    echo "Error: $SERVICE_FILE does not exist."
    exit 1
fi
