echo -e "\e[33mInstalling nginx\e[0m"
dnf install nginx -y &>/tmp/expense.log
echo exist status - $?

echo -e "\e[33m copying expense.conf\e[0m"
cp expense.conf/etc/nginx/default.d/expense.conf &>/tmp/expense.log
echo exist status - $?

echo -e "\e[33m remove content\e[0m"
rm -rf /usr/share/nginx/html/* &>/tmp/expense.log
echo exist status - $?

echo -e "\e[33m download content\e[0m"
curl -o /tmp/frontend.zip https://expense-artifacts.s3.amazonaws.com/expense-frontend-v2.zip &>/tmp/expense.log
echo exist status - $?
cd /usr/share/nginx/html


echo -e "\e[33m abstract content\e[0m"
unzip /tmp/frontend.zip &>/tmp/expense.log
echo exist status - $?

echo -e "\e[33mreboot content\e[0m"
systemctl enable nginx &>/tmp/expense.log
systemctl restart nginx &>/tmp/expense.log
echo exist status - $?





