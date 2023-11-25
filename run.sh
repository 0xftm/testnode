#!/bin/bash

echo -e "\e[1;33m"
echo "    __    __  __   __    _____   _______  _____    _____  __          __ _    _    ____  "
echo "   |  \  /  |\  \ /  /  / ____| |__   __||_   _|  / ____| \ \        / /| |  | |  / __ \ "
echo "   |   \/   | \  V  /  | (___      | |     | |   | |       \ \  /\  / / | |__| | | |  | |"
echo "   | |\  /| |  \   /    \___ \     | |     | |   | |        \ \/  \/ /  |  __  | | |  | |"
echo "   | | \/ | |   | |     ____) |    | |    _| |_  | |____     \  /\  /   | |  | | | |__| |"
echo "   |_|    |_|   |_|    |_____/     |_|   |_____|  \_____|     \/  \/    |_|  |_|  \____/ "
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
