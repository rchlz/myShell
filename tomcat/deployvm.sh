#!/bin/sh

APP_NAME=snsxiu-moss-web
APP_DIR=/data/web/
USER=hh

DEPLOY_TIME=`date +%G%m%d%H%M`;
SUB_DOMAIN=`date +%g%m%d`;

if [ -z $1 ]
then
	echo "Please input a server IP"
	exit
fi

echo -n "Deploy to $1? (yes/no)"
read confirm
if [ "$confirm" != 'yes' ]
then
	exit 1;
fi
#echo "bakup web..."
#ssh $USER@$1 "cp -r $APP_DIR/$APP_NAME $APP_DIR/$APP_NAME.$DEPLOY_TIME";
echo "rsync new web project"
rsync -avz --delete $APP_DIR/$APP_NAME/WEB-INF/templates/ $USER@$1:$APP_DIR/$APP_NAME/WEB-INF/templates/;

echo "******************** deploy $APP_NAME TEMPLATE to $1 done! ********************"
