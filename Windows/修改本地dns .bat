@echo on
echo "��ע�����ɱ�������ʾ��һ��Ҫ����"
@echo  ########################################
@xcopy C:\Windows\system32\drivers\etc\hosts C:\Windows\system32\drivers\etc\hosts.bak\ /d /c /i /y
@echo  ########################################
@echo  hosts�ļ�������ϣ���ʼ�޸�hosts�ļ�
@echo  >> C:\Windows\System32\drivers\etc\hosts
@echo 112.74.96.98   www.guoweiwei.com >> C:\Windows\System32\drivers\etc\hosts
echo   "hosts�ļ��޸����"
@ipconfig /flushdns
@echo   "ˢ��DNS���"
@echo off
@pause
