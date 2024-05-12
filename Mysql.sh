echo -e "\e[33mInstalling nginx\e[0m"
dnf install mysql-server -y
echo exist status - $?

echo -e "\e[33mInstalling nginx\e[0m"
systemctl enable mysqld
systemctl start mysqld
echo exist status - $?

echo -e "\e[33mInstalling nginx\e[0m"
mysql_secure_installation --set-root-pass $1
echo exist status - $?