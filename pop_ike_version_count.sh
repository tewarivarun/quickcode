#!/bin/zsh

pop_array=($(cat sft_servers.list| grep ipsec | awk '{print $1}'))
for pop in "${pop_array[@]}"
do
    echo $pop
    echo 'Collecting IKEv1 SAs'
    sft ssh $pop --command 'date && sudo swanctl --list-sa | grep IKEv1 | wc -l'

    echo 'Collecting IKEv2 SAs'
    sft ssh $pop --command 'date && sudo swanctl --list-sa | grep IKEv2 | wc -l'

done
