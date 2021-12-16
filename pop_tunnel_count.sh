#!/bin/zsh

pop_array=($(cat sft_servers.list| grep ipsec | awk '{print $1}'))
for pop in "${pop_array[@]}"
do
    echo "sft ssh $pop --command 'date && sudo swanctl --list-sas | grep ESTAB | wc -l'"
    echo "Ike SAs"
    sft ssh $pop --command 'date && sudo swanctl --list-sa | grep ESTAB | wc -l'

    echo "IPsec SAs"
    sft ssh $pop --command 'date && sudo swanctl --list-sa | grep TUNNEL-in-UDP | wc -l'

    echo "Tunc Count"
    sft ssh $pop --command 'date && ip link | grep tunc | wc -l'

done
