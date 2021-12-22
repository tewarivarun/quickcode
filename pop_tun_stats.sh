#!/bin/bash

tunc_array=($(ifconfig | grep tun | awk '{print $1}'))
for i in {1 . . 4}
do
    date
    for tunc in "${tunc_array[@]}"
    do
        echo "Tx Dropped: /sys/class/net/$tunc/statistics/tx_dropped"
	cat /sys/class/net/$tunc/statistics/tx_dropped

	echo "Tx Error: /sys/class/net/$tunc/statistics/tx_errors"
	cat /sys/class/net/$tunc/statistics/tx_errors


	echo "Rx Dropped: /sys/class/net/$tunc/statistics/rx_dropped"
	cat /sys/class/net/$tunc/statistics/rx_dropped

	echo "Rx Error: /sys/class/net/$tunc/statistics/rx_error"
	cat /sys/class/net/$tunc/statistics/rx_errors
    done
echo "Waiting for 10 seconds"
sleep 10
done
