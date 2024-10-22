#!/bin/bash

SCRIPT_DIR="$(dirname "$0")"
SCRIPT_PATH="$SCRIPT_DIR/{YOURSCRIPT.sh}" #Replace {YOURSCRIPT.sh} remove brackets. 

if [ ! -f "$SCRIPT_PATH" ]; then
    echo "Error: $SCRIPT_PATH does not exist."
    exit 1
fi

SERVICE_FILE="/etc/systemd/system/{YOUR_SVC_NAME}.service" #Replace {YOUR_SVC_NAME} with desired service name. Must not conflict with amy existing service names.
echo "[Unit]
Description=null
[Service]
Type=simple
ExecStart=/bin/bash $SCRIPT_PATH
User=root
[Install]
WantedBy=multi-user.target" | sudo tee $SERVICE_FILE > /dev/null

sudo systemctl daemon-reload
sudo systemctl enable {YOUR_SVC_NAME}.service #Replace {YOUR_SVC_NAME} with same name used in last one. 
echo "Success. The script will run at startup with superuser permissions."
