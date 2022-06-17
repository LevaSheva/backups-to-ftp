#!/bin/sh
cd /home/bitrix/backup/archive/
HOST='*****************'
USER='*****************'
PASSWD='***************'
/usr/bin/ftp -n $HOST <<EOF
	quote USER $USER
	quote PASS $PASSWD
	passive
	binary
	prompt
	cd /
	mdelete *.tar.gz
	mput *.tar.gz
	bye
EOF
if [ $? -eq 0 ]; then
cd /home/bitrix/backup/
rm -rf /home/bitrix/backup/archive/
fi
