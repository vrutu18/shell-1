echo Installing nginx
dnf install nginx -y
echo copying expense.conf
cp expense.conf/etc/nginx/default.d/expense.conf
echo reboot content
systemctl enable nginx
systemctl start nginx
echo remove content
rm -rf /usr/share/nginx/html/*
echo download content
curl -o /tmp/frontend.zip https://expense-artifacts.s3.amazonaws.com/expense-frontend-v2.zip
echo abstract content
cd /usr/share/nginx/html
unzip /tmp/frontend.zip
echo restart content
systemctl restart nginx