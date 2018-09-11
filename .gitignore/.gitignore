#!/bin/
version=`pwd`;echo ${version##*/}
for i in `ls -d */|grep _`;do echo $i;mv $i `echo $i|cut -d _ -f1|tr A-Z a-z`;done 
find . -name "*.gz"|xargs -i tar -xvf {}
find . -name "config.xml"|xargs -i sed -i "s/192.168.126.132/192.168.149.128/g" {}
find . -name "*.sql"|grep mysql|xargs -i sed -i "s/cdn_db/${version}/g" {}
for i in `find . -name "*.sql"|grep mysql`;do mysql -uroot -p123456 -e "source ${i};";done
