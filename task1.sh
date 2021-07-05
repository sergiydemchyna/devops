#/bin/bash

if [[ $UID -eq 0 && -d $2 ]]
then
echo "Все ok"
chown -R $1 $2
ls -l
else
echo  "ОЙ, шось пішло не так"
fi