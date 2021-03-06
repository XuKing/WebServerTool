#!/bin/sh

#comments
echo "Please enter the site name :"
read Path
echo "VHost Name : $Path"

#create webfile root
mkdir /var/www/$Path
echo "Create folder '/var/www/$Path' successfully !"
echo "."
#create web root
mkdir /var/www/$Path/wwwroot
echo "Create folder '/var/www/$Path/wwwroot' successfully !"
echo "."

#mkdir /var/www/$Path/data
#echo "Create folder '/var/www/$Path/data' successfully !"

#create web log 
mkdir /var/www/$Path/log
echo "Create folder '/var/www/$Path/log' successfully !"
echo "."

#create vhost config file

echo "server {" >>/etc/nginx/conf.d/$Path.conf
echo "    listen       80;" >>/etc/nginx/conf.d/$Path.conf
echo "    server_name  $Path;" >>/etc/nginx/conf.d/$Path.conf
echo "    access_log  /var/www/$Path/log/$Path.access.log  main;" >>/etc/nginx/conf.d/$Path.conf

echo "    include /etc/nginx/default.d/*.conf;" >>/etc/nginx/conf.d/$Path.conf

echo "    location / {" >>/etc/nginx/conf.d/$Path.conf
echo "        root   /var/www/$Path/wwwroot;" >>/etc/nginx/conf.d/$Path.conf
echo "        index  index.html index.php index.htm;" >>/etc/nginx/conf.d/$Path.conf
echo "    }" >>/etc/nginx/conf.d/$Path.conf

echo "    location ~ \.php$ {" >>/etc/nginx/conf.d/$Path.conf
echo "        root           /var/www/$Path/wwwroot;" >>/etc/nginx/conf.d/$Path.conf
echo "        fastcgi_pass   127.0.0.1:9000;" >>/etc/nginx/conf.d/$Path.conf
echo "        fastcgi_index  index.php;" >>/etc/nginx/conf.d/$Path.conf
echo "        fastcgi_param  SCRIPT_FILENAME  \$document_root\$fastcgi_script_name;" >>/etc/nginx/conf.d/$Path.conf
echo "        include        fastcgi_params;" >>/etc/nginx/conf.d/$Path.conf
echo "    }" >>/etc/nginx/conf.d/$Path.conf
echo "}" >>/etc/nginx/conf.d/$Path.conf

#Change the directory permissions
chown -R nginx:nginx /var/www/$Path
#nginx config test
nginx -t
#nginx reload config
nginx -s reload

echo "Create Site $Path successfully !"
