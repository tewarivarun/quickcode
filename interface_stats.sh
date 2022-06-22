#!/bin/bash

INTERVAL="2"  # update interval in seconds

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
        RxBytes1=`cat /sys/class/net/$1/statistics/rx_bytes`
        TxBytes1=`cat /sys/class/net/$1/statistics/tx_bytes`

        sleep $INTERVAL
        R2=`cat /sys/class/net/$1/statistics/rx_packets`
        T2=`cat /sys/class/net/$1/statistics/tx_packets`
        DRX2=`cat /sys/class/net/$1/statistics/rx_dropped`
        DTX2=`cat /sys/class/net/$1/statistics/tx_dropped`
        RxBytes2=`cat /sys/class/net/$1/statistics/rx_bytes`
        TxBytes2=`cat /sys/class/net/$1/statistics/tx_bytes`

        TXPPS=`expr $T2 - $T1`
        TXPPS=`expr $TXPPS / $INTERVAL`
        RXPPS=`expr $R2 - $R1`
        RXPPS=`expr $RXPPS / $INTERVAL`
        DRXPPS=`expr $DRX2 - $DRX1`
        DRXPPS=`expr $DRXPPS / $INTERVAL`
        DTXPPS=`expr $DTX2 - $DTX1`
        DTXPPS=`expr $DTXPPS / $INTERVAL`

        TxBPS=`expr $TxBytes2 - $TxBytes1`
        TxBPS=`expr $TxBPS / $INTERVAL`
	# in KB
        TxBPS=`expr $TxBPS / 1024`
	# in MB
        TxBPS=`expr $TxBPS / 1024`

        RxBPS=`expr $RxBytes2 - $RxBytes1`
        RxBPS=`expr $RxBPS / $INTERVAL`
	# in kB
        RxBPS=`expr $RxBPS / 1024`
	# in mB
        RxBPS=`expr $RxBPS / 1024`

        echo "$1: TX : $TXPPS pkts/s $TxBPS MBytes/s RX : $RXPPS pkts/s $RxBPS MBytes/s DRX : $DRXPPS pkts/s DTX : $DTXPPS pkts/s"
done
