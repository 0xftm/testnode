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

folder_to_check="$HOME/tokio-docker/"
# Khai báo biến
reward=""
evm_address=""
evm_private_key=""

identity=""
enr_address=""
graffiti=""
ethstats=""

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


# Kiểm tra xem thư mục tồn tại không
if [ -d "$folder_to_check" ]; then
    echo "Thư mục tồn tại. Đang xóa..."
    rm -r "$folder_to_check"  # Xóa thư mục và tất cả các nội dung bên trong
    echo "Thư mục đã được xóa."
else
    echo "Thư mục không tồn tại."
fi

# sudo apt update && apt upgrade -y

git clone https://github.com/engram-network/tokio-docker.git 
cd tokio-docker
git checkout dencun
# sudo chmod +x ./scripts/*.sh
# ./scripts/install-docker.sh
# ./scripts/install-asdf.sh
# mkdir -p execution consensus

echo "Sua file: validator-deposit-data.sh"
# sudo nano ./scripts/validator-deposit-data.sh
sed -i "s/^amount=32000000000/amount=20000000000/g" ./scripts/validator-deposit-data.sh
sed -i "s/test test test test test test test test test test test junk/$reward/g" ./scripts/validator-deposit-data.sh
sed -i "s/0x000000000000000000000000000000000000000b/$evm_address/g" ./scripts/validator-deposit-data.sh
sed -i "s/0x000000000000.....................0000000000000/$evm_private_key/g" ./scripts/validator-deposit-data.sh

bash ./scripts/validator-deposit-data.sh
./scripts/validator-build.sh


# Lặp lại việc nhập thông tin cho đến khi các trường đều không trống
while [ -z "$identity" ] || [ -z "$enr_address" ] || [ -z "$graffiti" ] || [ -z "$ethstats" ]; do
    read -p "Nhập tên Node: " ethstats
    read -p "Nhập id discord: " identity
    read -p "Nhập địa chỉ IP public: " enr_address
    read -p "Nhập tên: " graffiti

    # Kiểm tra nếu bất kỳ trường nào là rỗng, yêu cầu người dùng nhập lại
    if [ -z "$reward" ] || [ -z "$evm_address" ] || [ -z "$evm_private_key" ]  || [ -z "$ethstats" ]; then
        echo "Vui lòng điền đầy đủ thông tin."
    fi
done

sed -i "s/      - --identity=Huemint # Change With Your userdiscord without handle or hastag/      - --identity=$identity/g" ./docker-compose.yml
sed -i "s/      - --enr-address=0.0.0.0/      - --enr-address=$enr_address/g" ./docker-compose.yml
sed -i "s/      - --graffiti=Huemint /      - --graffiti=$graffiti/g" ./docker-compose.yml
sed -i "s/      - --ethstats=YourNameNodeHere:engramstats@nodewatch.engram.tech/      - --ethstats=$ethstats:engramstats@nodewatch.engram.tech /g" ./docker-compose.yml


sleep 2;
