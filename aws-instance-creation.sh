#!/bin/bash

set -x

instance_name=$1
echo "$instance_name" 
aws ec2 run-instances --image-id ami-0cb91c7de36eed2cb --count 1 --instance-type t2.micro --key-name my-first-aws-vm-bvelaga-keypair --security-group-ids sg-0e76a37ddbe5e7ca9 --subnet-id subnet-0bca10c44fc6d7130 --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value= ($instance_name)}]'
