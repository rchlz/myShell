#!/bin/sh

APP_NAME=snsxiu-moss-web
APP_DIR=/data/web/
TOMCAT_DIR=/opt/tomcat-moss
USER=hh

DEPLOY_TIME=`date +%G%m%d%H%M`;
SUB_DOMAIN=`date +%g%m%d`;

if [ -z $1 ]
then
	echo "Please input a server IP"
	exit
fi
IP="$1";
echo -n "Deploy to $1? (yes/no)"
read confirm
if [ "$confirm" != 'yes' ]
then
	exit 1;
fi
echo "bakup web..."
ssh $USER@$IP "cp -r $APP_DIR/$APP_NAME $APP_DIR/$APP_NAME.$DEPLOY_TIME";
echo "rsync new web project"
rsync -avz --delete $APP_DIR/$APP_NAME/ $USER@$IP:$APP_DIR/$APP_NAME/;
echo "restart tomcat"
ssh $USER@$IP "$TOMCAT_DIR/bin/shutdown.sh;for jre in \$(ps aux|grep \"$TOMCAT_DIR/\"|grep -v grep|awk '{print \$2}'); do kill -9 \${jre};done;sh $TOMCAT_DIR/bin/startup.sh"

echo "Wait For Tomcat Ready ..."
sleep 5

echo "******************** deploy $APP_NAME to $1 done! ********************"
