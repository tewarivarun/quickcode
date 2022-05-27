#!/bin/bash

INTERVAL="1"  # update interval in seconds

if [ -z "$1" ]; then
        echo
        echo usage: $0 [network-interface]
        echo
        echo e.g. $0 eth0
        echo
        echo shows packets-per-second
        exit
fi

IF=$1

while true
do
        R1=`cat /sys/class/net/$1/statistics/rx_packets`
        T1=`cat /sys/class/net/$1/statistics/tx_packets`
        DRX1=`cat /sys/class/net/$1/statistics/rx_dropped`
        DTX1=`cat /sys/class/net/$1/statistics/tx_dropped`
        sleep $INTERVAL
        R2=`cat /sys/class/net/$1/statistics/rx_packets`
        T2=`cat /sys/class/net/$1/statistics/tx_packets`
        DRX2=`cat /sys/class/net/$1/statistics/rx_dropped`
        DTX2=`cat /sys/class/net/$1/statistics/tx_dropped`
        TXPPS=`expr $T2 - $T1`
        RXPPS=`expr $R2 - $R1`
        DRXPPS=`expr $DRX2 - $DRX1`
        DTXPPS=`expr $DTX2 - $DTX1`
        echo "$1: TX : $TXPPS pkts/s RX : $RXPPS pkts/s DRX : $DRXPPS pkts/s DTX : $DTXPPS pkts/s"
done
