@echo on
echo "请注意你的杀毒软件提示，一定要允许"
@echo  ########################################
@xcopy C:\Windows\system32\drivers\etc\hosts C:\Windows\system32\drivers\etc\hosts.bak\ /d /c /i /y
@echo  ########################################
@echo  hosts文件备份完毕，开始修改hosts文件
@echo  >> C:\Windows\System32\drivers\etc\hosts
@echo 112.74.96.98   www.guoweiwei.com >> C:\Windows\System32\drivers\etc\hosts
echo   "hosts文件修改完成"
@ipconfig /flushdns
@echo   "刷新DNS完成"
@echo off
@pause
