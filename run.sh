#!/bin/bash

banner() {
clear
cat << "EOF"
 _______  ___      __   __  _______  _______  __   __  _______  _______  __    _ 
|       ||   |    |  | |  ||       ||       ||  |_|  ||       ||       ||  |  | |
|    ___||   |    |  |_|  ||_     _||   _   ||       ||   _   ||   _   ||   |_| |
|   |___ |   |    |       |  |   |  |  | |  ||       ||  | |  ||  | |  ||       |
|    ___||   |___ |_     _|  |   |  |  |_|  ||       ||  |_|  ||  |_|  ||  _    |
|   |    |       |  |   |    |   |  |       || ||_|| ||       ||       || | |   |
|___|    |_______|  |___|    |___|  |_______||_|   |_||_______||_______||_|  |__|  

EOF
}
banner;

echo "===========Engram Network Installing======= " && sleep 1

while true; do
    echo "Nhập tên của bạn:"
    read name

    if (( ${#name} < 3 )); then
        echo "Tên phải có ít nhất 3 ký tự. Vui lòng nhập lại."
    else
        break
    fi
done

echo "Nhập tuổi của bạn:"
read age

echo "Tên: $name, Tuổi: $age"


# read -p "Enter your Node name: " input_moniker
# if [ -z "$input_moniker" ]; then
# echo "Node Name cannot be empty!"
# exit 1
# fi
# MONIKER="$input_moniker"
# echo "Node Name is: $MONIKER"

# sudo apt update && apt upgrade -y

# git clone https://github.com/engram-network/tokio-docker.git 
# cd tokio-docker
# git checkout dencun
# sudo chmod +x ./scripts/*.sh
# ./scripts/install-docker.sh
# ./scripts/install-asdf.sh
# mkdir -p execution consensus


 
# sleep 2;
# # set vars
# AVAIL_TAG="v1.8.0.2"
# if [ ! $AVAIL_NODE_NAME ]; then
# 	read -p "Enter node name: " AVAIL_NODE_NAME
# 	echo 'export AVAIL_NODE_NAME='$AVAIL_NODE_NAME >> $HOME/.bash_profile
# fi
# source $HOME/.bash_profile
# echo -e '================================================='
# echo -e "Your node name: \e[1;33m$AVAIL_NODE_NAME\e[0m"
# echo -e "Your p2p port: \e[1;33m30333\e[0m"
# echo -e "Your rpc port: \e[1;33m9944\e[0m"
# echo -e "Your prometheus port: \e[1;33m9615\e[0m"
# echo '================================================='
# sleep 2;
