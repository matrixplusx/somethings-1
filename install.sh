#!/bin/
version=`pwd`;echo ${version##*/}
local_ip=`ss|grep ssh|awk 'NR==1{print $4}'|cut -d \: -f1`
for i in `ls -d */|grep _`;do echo $i;mv $i `echo $i|cut -d _ -f1|tr A-Z a-z`;done 
find . -name "*.gz"|xargs -i tar -xvf {}
find . -name "config.xml"|xargs -i sed -i "s/192.168.126.132/${local_ip}/g" {}
find . -name "*.sql"|grep mysql|xargs -i sed -i "s/cdn_db/${version}/g" {}
for i in `find . -name "*.sql"|grep mysql`;do mysql -uroot -p123456 -e "source ${i};";done
