#ispconfig

sed -i 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/selinux/config
setenforce 0
yum -y install net-tools
systemctl stop firewalld.service
systemctl disable firewalld.service
yum -y install nano wget NetworkManager-tui yum-utils

echo "localhost server1.example.com server1" >> /etc/hosts

echo "server1.example.com" > /etc/hostname

rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY*
yum -y install epel-release
yum -y update
sleep 3
yum -y groupinstall 'Development Tools'

yum -y install quota

#mount | grep ' / '

wget https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
wget http://rpms.remirepo.net/enterprise/remi-release-7.rpm
rpm -Uvh remi-release-7.rpm 
rpm -Uvh epel-release-latest-7.noarch.rpm
yum --enablerepo=remi 

yum install -y mariadb-server
systemctl restart mariadb
#mysql_secure_installation

yum install yum-utils -y
yum-config-manager --disable remi-php54
yum-config-manager --enable remi-php73
yum install install httpd mod_ssl php php-mysql php-mbstring -y
#yum -y install php php-cli php-fpm php-mysqlnd php-zip php-devel php-gd php-mcrypt php-mbstring php-curl php-xml php-pear php-bcmath php-json
yum install ntp -y

yum --enablerepo=remi install phpMyAdmin -y

echo "RequestHeader unset Proxy early" >> /etc/httpd/conf/httpd.conf
service httpd restart

yum -y install bind bind-utils

cd /opt/
wget http://www.ispconfig.org/downloads/ISPConfig-3-stable.tar.gz
tar -zxvf ISPConfig-3-stable.tar.gz
cd ispconfig3_install/install/
php -q install.php

#https://server_IP_address:8080/
