#!/bin/zsh

tunc_array=($(ifconfig | grep tunc | awk '{print $1}'))
for tunc in "${tunc_array[@]}"
do
    echo "Tx Dropped: /sys/class/net/$tunc/statistics/tx_dropped"
    cat /sys/class/net/$tunc/statistics/tx_dropped
done
