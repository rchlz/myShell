#build www
# write by zhangdong zhangdong147896325@163.com
WEB_DIR="/home/admin/project/snsxiu/snsxiu-moss/";
TARGET_DIR="/data/web/snsxiu-moss-web/";
function equit () {
  echo $1
  exit 1
}
function step(){
  if [ -n "$COMMAND" -a "$COMMAND" = "$1" ] || [ -z "$COMMAND" ] || [ "$EXECUTE" -eq "1" ]; then
    echo "STEP[$STEP] $1"
    STEP=$(($STEP + 1))
    EXECUTE=1
    return 0
  fi
  return 1
}

cd $WEB_DIR
svn up
version=`svn info|grep -E "^版本: "|awk '{print $2}'`
#clean 
if step "clean"; then
  if ! mvn clean >> /dev/null; then
    equit "Ops. Clean Failed"
  fi
fi
#install
if step "install" ; then
  if ! mvn install -U >> /dev/null; then
    equit "Ops. Install Failed"
  fi
fi
#check if the target is ok?
if [ ! -e target/$FULL_NAME ]; then
  equit "Ops. Cannot find target/$FULL_NAME"
fi

#sed -ie "s/{ASSETSVERSION}/${version}/" target/snsxiu-moss-web/templates/layout/*.vm

#kill tomcat-test
if step "kill tomcat" ;then
   if ! ps aux|grep tomcat-moss|grep -v grep|awk '{print $2}'|xargs -i kill -9 {} >> /dev/null;then
	equit "Ops.Kill tomcat failed"
   fi
fi

#copy file
if step "rsync file" ;then
   if ! rsync -avz --delete target/snsxiu-moss-web/ $TARGET_DIR >> /dev/null;then
        equit "rsync file faied"
   fi
fi

if step "start tomcat" ;then
   if ! /opt/tomcat-moss/bin/catalina.sh start >> /dev/null;then
	equit "start tomcat filed"
   fi
fi

echo "finished!"


