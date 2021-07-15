#!/bin/bash

if [[ $UID -eq 0 && -d $2 ]]
then
echo "change of owner"
chown -R $1:$1 $2
ls -l
else
echo  "Error! user: $1 or files $2 not found! "
fi



