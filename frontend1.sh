echo -e "\e[33mInstalling nginx\e[0m"
dnf install nginx -y
echo -e "\e[33m copying expense.conf\e[0m"
cp expense.conf/etc/nginx/default.d/expense.conf
echo -e "\e[33mreboot content\e[0m"
systemctl enable nginx
systemctl start nginx
echo -e "\e[33m remove content\e[0m"
rm -rf /usr/share/nginx/html/*
echo -e "\e[33m download content\e[0m"
curl -o /tmp/frontend.zip https://expense-artifacts.s3.amazonaws.com/expense-frontend-v2.zip
echo -e "\e[33m abstract content\e[0m"
cd /usr/share/nginx/html
unzip /tmp/frontend.zip
echo -e "\e[33m restart content\e[0m"
systemctl restart nginx