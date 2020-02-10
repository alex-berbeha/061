yum update -y
chmod a+x /vagrant/atlassian-confluence-7.3.1-x64.bin
printf 'o \n 1 \n i \n y \n' | /vagrant/atlassian-confluence-7.3.1-x64.bin
yum localinstall -y https://dev.mysql.com/get/mysql57-community-release-el7-9.noarch.rpm
yum update -y
yum install -y mysql-community-server
systemctl start mysqld
systemctl enable mysqld
temp_pass=`sudo grep 'A temporary password' /var/log/mysqld.log |tail -1 | awk '{print $11}'`
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '2we5?64Tgb'; \n flush privileges;" | mysql -h localhost --connect-expired-password -u root --password=$temp_pass
temp_pass=2we5?64Tgb
echo "UNINSTALL PLUGIN validate_password;" | mysql -h localhost --connect-expired-password -u root --password=$temp_pass
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '123456'; \n flush privileges;" | mysql -h localhost --connect-expired-password -u root --password=$temp_pass
temp_pass=123456
echo "CREATE DATABASE CONFLUENCE;" | mysql -h localhost --connect-expired-password -u root --password=$temp_pass
