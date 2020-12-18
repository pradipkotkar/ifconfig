#!/bin/sh
sed -i 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/selinux/config
setenforce 0
yum -y install net-tools
systemctl stop firewalld.service
systemctl disable firewalld.service
yum -y install nano wget NetworkManager-tui yum-utils

echo "localhost server1.example.com server1" >> :/etc/hosts

echo "server1.example.com" >> /etc/hostname

rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY*
yum -y install epel-release
yum -y update
sleep 3
yum -y groupinstall 'Development Tools'

yum -y install quota
