#!/bin/bash
component=$1
environment=$2 # env is keyword in linux
version=$3

sudo yum install python3.11-devel python3.11-pip -y
sudo pip3.11 install ansible botocore boto3
ansible-pull -U https://github.com/saitejagovindaram/ansible-roboshop-roles-tf-jk.git -e component=$component -e env=$environment -e version=$version main.yaml