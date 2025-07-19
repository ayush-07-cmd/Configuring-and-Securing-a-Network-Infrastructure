#!/bin/bash

echo "Starting monitoring tools installation..."

# Update system
sudo apt update && sudo apt upgrade -y

# Install iftop for traffic monitoring
sudo apt install iftop -y

# Install Netdata for real-time web-based monitoring
bash <(curl -Ss https://my-netdata.io/kickstart.sh)

echo "Installation complete!"
echo "Run 'iftop' to monitor traffic or open Netdata in your browser: http://localhost:19999"
