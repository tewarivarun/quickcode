#!/bin/zsh

pop_array=($(cat sft_servers.prod.list| grep ipsec | awk '{print $1}'))
for pop in "${pop_array[@]}"
do
    echo $pop >> mq_list
    sft ssh $pop --command 'cat /opt/ns/tunsvc/cfg/netskope.tunsvc.cfg | grep tun-multiqueue-support; ifconfig bond0.400 | grep inet; lsb_release -r' >> mq_list
done

pop_array=($(cat sft_servers.prod.list| grep dpsvclb | awk '{print $1}'))
for pop in "${pop_array[@]}"
do
    echo $pop >> mq_list
    sft ssh $pop --command 'sudo ipvsadm -L -f 80' >> mq_list
done
