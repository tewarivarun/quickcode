#!/bin/zsh

conn_array=($(sudo swanctl --list-conns | grep IKE | awk '{print substr($1, 1, length($1)-1)}'))
for conn in "${conn_array[@]}"
do
    echo "Creating Ipsec SA for $conn"
    sudo swanctl --initiate --child $conn
    sleep 1
done
