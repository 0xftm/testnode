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

echo "Nhập mật khẩu của root:"
su -c 'whoami' 

# Khai báo biến
reward=""
evm_address=""
evm_private_key=""

# Lặp lại việc nhập thông tin cho đến khi các trường đều không trống
while [ -z "$reward" ] || [ -z "$evm_address" ] || [ -z "$evm_private_key" ]; do
    read -p "Nhập 24 ký tự ví nhận reward: " reward
    read -p "Nhập địa chỉ ví EVM: " evm_address
    read -p "Nhập private key ví EVM: " evm_private_key

    # Kiểm tra nếu bất kỳ trường nào là rỗng, yêu cầu người dùng nhập lại
    if [ -z "$reward" ] || [ -z "$evm_address" ] || [ -z "$evm_private_key" ]; then
        echo "Vui lòng điền đầy đủ thông tin (24 ký tự ví nhận reward, địa chỉ ví EVM và private key ví EVM)."
    fi
done

# echo -e '================================================='
# echo -e "Your node name: \e[1;33m$AVAIL_NODE_NAME\e[0m"
# echo -e "Your p2p port: \e[1;33m30333\e[0m"
# echo -e "Your rpc port: \e[1;33m9944\e[0m"
# echo -e "Your prometheus port: \e[1;33m9615\e[0m"
# echo '================================================='
# sleep 2;

# sudo apt update && apt upgrade -y

git clone https://github.com/engram-network/tokio-docker.git 
cd tokio-docker
git checkout dencun
# sudo chmod +x ./scripts/*.sh
# ./scripts/install-docker.sh
# ./scripts/install-asdf.sh
# mkdir -p execution consensus

# sudo nano ./scripts/validator-deposit-data.sh
sed -i 's/^amount=32000000000/amount=20000000000/g' ./scripts/validator-deposit-data.sh
sed -i 's/test test test test test test test test test test test junk/abc abc asda/g' ./scripts/validator-deposit-data.sh

sed -i 's/0x000000000000000000000000000000000000000b/$evm_address/g' ./scripts/validator-deposit-data.sh
sed -i 's/0x000000000000.....................0000000000000/$evm_private_key/g' ./scripts/validator-deposit-data.sh




sleep 2;
