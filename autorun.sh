#!/bin/bash

#Replace {YOURSCRIPT.sh} remove brackets.
YOUR_SCRIPT= "{YOURSCRIPT.sh}" 
# Replace {YOUR_SVC_NAME} with the service name youd like to use. 
#Must not conflict with any existing service names. 
SERVICE_NAME="{YOUR_SVC_NAME}" 

SCRIPT_DIR="$(dirname "$0")"
SCRIPT_PATH="$SCRIPT_DIR/$YOUR_SCRIPT" . 

if [ ! -f "$SCRIPT_PATH" ]; then
    echo "Error: $SCRIPT_PATH does not exist."
    exit 1
fi

SERVICE_FILE="/etc/systemd/system/$SERVICE_NAME.service" 
echo "[Unit]
Description=null
[Service]
Type=simple
ExecStart=/bin/bash $SCRIPT_PATH
User=root
[Install]
WantedBy=multi-user.target" | sudo tee $SERVICE_FILE > /dev/null

sudo systemctl daemon-reload
sudo systemctl enable $SERVICE_NAME.service
echo "Success. The script will run at startup with superuser permissions."
