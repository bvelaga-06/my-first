#!/bin/bash

instance_id_list=($(aws ec2 describe-instances | jq '.Reservations[].Instances[].InstanceId'))
echo "${instance_id_list[@]}"

declare -a new_instance_id_list=()
for i in "${instance_id_list[@]}"
do 
	a=$(echo "$i" | tr -d '"')
	new_instance_id_list+=$a
	echo "$a"
	aws ec2 terminate-instances --instance-ids $a
done 

