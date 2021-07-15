#!bin/bash
# Backup  directory
backupfolder=/home/sergiy/dump
# MySQL user
user=root
# MySQL password
password=@132423xvbnfgfdghrhfdhbsfh#@%@%#z 
sqlfile=$backupfolder/$(date +%d%m%Y_%H%M).sql
# Create a backup 
sudo mysqldump -u $user -p$password --all-databases > $sqlfile 
if [ $? == 0 ]; then
  echo 'Sql dump created' 
else
  echo 'No backup was created!'
  exit 
fi 



