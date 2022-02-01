#!/bin/zsh

for (( i=10; i<=1245; i++ ))
do
	echo "Creating tunc$i"
	ip tuntap add dev tunc$i mode tun multi_queue
	ip link set dev tunc$i up txqueuelen 4000
	sleep 0.5
done
