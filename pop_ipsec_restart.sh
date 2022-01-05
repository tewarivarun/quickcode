#!/bin/zsh

sft list-servers > sft_servers.list
pop_array=($(cat sft_servers.list| grep ipsec | awk '{print $1}'))
for pop in "${pop_array[@]}"
do
    echo "Restarting Tunsvc"
    sft ssh $pop --command 'date && sudo supervisorctl stop tunsvc && sleep 1 && sudo supervisorctl start tunsvc'
done
