#! /usr/bin/env bash
 
set -e
 
# Helps clear issues of not finding Ansible package,
# perhaps due to updates running when server is first spun up
sleep 10
 
export DEBIAN_FRONTEND="noninteractive"

apt-get update
apt-get -y install sudo
 
# Removing faulty postfix files
rm /var/spool/postfix/dev/random
rm /var/spool/postfix/dev/urandom