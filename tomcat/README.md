# TOMCAT脚本

### build.sh
> tomcat构建脚本，用于将java web打包成war包并重启tomcat

### deploy.sh
> 用于将打包好的war包远程上传到指定的服务器，并且重启远程tomcat 用法 ./deploy.sh 192.168.0.2

### deployvm.sh
> 用于将本地构建好的web目录下templates文件同步到远程服务器，不会启动远程的tomcat

### tomcat
> tomcat启动脚本，一般放在linux(CentOS6)的/etc/rc.d/init.d/目录下。CentOS7系统则是在另外的目录，详见https://github.com/rchlz/myShell/tree/master/Linux/CentOS7


### 创建tomcat的运行用户www
> groupadd www
> useradd --shell /sbin/nologin -g www www