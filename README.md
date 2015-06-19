# WebServerTool
脚本主要作为平时管理VPS的工具，在平时的操作中，经常增加虚拟主机，需要建立文件夹，建立vHOST.CONF，重新加载NGINX等。
脚本默认在 /var/www/下建立虚拟主机文件，分别建立 log，wwwroot

LOG文件夹的作用是保存nginx访问记录，方便查看。
WWWROOT文件夹是站点根目录。

同时会在/etc/nginx/conf.d/下建立主机配置文件 Domain.conf

运行脚本后，输入你要建立的主机域名Domain，

文件结构

|

|--/var/www/Domain name/

|--/var/www/Domain name/log/

|--/var/www/Domain name/wwwroot/

|--/etc/nginx/conf.d/Domain name.conf
