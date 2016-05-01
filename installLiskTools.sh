#!/bin/bash

default_tools_location=~
default_backup_location=~

read -r -p "Where do you want to install to? (Default $default_tools_location):  " tools_location
tools_location=${tools_location:-$default_tools_location}
if [[ ! -r "$tools_location" ]]
then
echo "$tools_location is not valid, please check and re-excute"
exit 2;
fi


read -r -p "Where do you want to install to? (Default $default_backup_location):  " backup_location
backup_location=${backup_location:-$default_backup_location}
if [[ ! -r "$backup_location" ]]
then
echo "$backup_location is not valid, please check and re-excute"
exit 2;
fi

read -p "Do you want to install the Ban Tool? Y or N: " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then

sudo apt-get -qqy install ipset

sudo ipset create excluded_list hash:net

cd $tools_location

wget https://github.com/slasheks/lisk-api/archive/master.zip

unzip master.zip

mv lisk-api-master lisk-api

rm -f master.zip

cd lisk-api/python2/

wget https://raw.githubusercontent.com/vinay20045/json-to-csv/master/json_to_csv.py

fi

cd $tools_location

wget https://github.com/Isabello/Lisk_Management_Tools/archive/master.zip

unzip master.zip

mv Lisk_Management_Tools-master/ Lisk_Management_Tools

rm -f master.zip

cd Lisk_Management_Tools

mkdir -p $tools_location/Lisk_Management_Tools/ban_list
mkdir -p $backup_location/pg_backups