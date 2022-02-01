#!/bin/zsh

for (( i=10; i<=1245; i++ ))
do
	echo "Deleting tunc$i"
	ip tuntap del dev tunc$i mode tun multi_queue
	sleep 0.2
done
