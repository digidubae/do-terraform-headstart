#!/bin/zsh
my_public_ip_address=$(curl -4 -s ifconfig.co)
export TF_VAR_my_public_ip_address="$my_public_ip_address"
echo $TF_VAR_my_public_ip_address 