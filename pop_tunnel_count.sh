#!/bin/zsh

pop_array=($(cat sft_servers.list| grep ipsec | awk '{print $1}'))
for pop in "${pop_array[@]}"
do
    echo "sft ssh $pop --command 'date && sudo swanctl --list-sas | grep ESTAB | wc -l'"
    sft ssh $pop --command 'date && sudo swanctl --list-sa | grep ESTAB | wc -l'
done
