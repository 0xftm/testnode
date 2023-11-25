#!/bin/bash

echo -e "\e[1;33m"
echo "                                                                                   "
echo "  _______  ___      __   __  _______  _______  __   __  _______  _______  __    _  "
echo " |       ||   |    |  | |  ||       ||       ||  |_|  ||       ||       ||  |  | | "
echo " |    ___||   |    |  |_|  ||_     _||   _   ||       ||   _   ||   _   ||   |_| | "
echo " |   |___ |   |    |       |  |   |  |  | |  ||       ||  | |  ||  | |  ||       | "
echo " |    ___||   |___ |_     _|  |   |  |  |_|  ||       ||  |_|  ||  |_|  ||  _    | "
echo " |   |    |       |  |   |    |   |  |       || ||_|| ||       ||       || | |   | "
echo " |___|    |_______|  |___|    |___|  |_______||_|   |_||_______||_______||_|  |__| "
echo "                                                                                   "
echo -e "\e[0m"
sleep 2;
# set vars
AVAIL_TAG="v1.8.0.2"
if [ ! $AVAIL_NODE_NAME ]; then
	read -p "Enter node name: " AVAIL_NODE_NAME
	echo 'export AVAIL_NODE_NAME='$AVAIL_NODE_NAME >> $HOME/.bash_profile
fi
source $HOME/.bash_profile
echo -e '================================================='
echo -e "Your node name: \e[1;33m$AVAIL_NODE_NAME\e[0m"
echo -e "Your p2p port: \e[1;33m30333\e[0m"
echo -e "Your rpc port: \e[1;33m9944\e[0m"
echo -e "Your prometheus port: \e[1;33m9615\e[0m"
echo '================================================='
sleep 2;
