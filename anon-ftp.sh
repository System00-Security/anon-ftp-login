#!/bin/bash
while getopts :l: param
do
    case "${param}" in
        l)list=${OPTARG};;
    esac
done
echo -e """ \033[31m
─────▄───▄
─▄█▄─█▀█▀█─▄█▄
▀▀████▄█▄████▀▀
─────▀█▀█▀\033[32m
---------------- -[JoyGhosh]-
   ANON-FTP
----------------\033[0m
"""
for l in $(cat $list)
do
curl -m 6 -s ftp://$l --user "Anonymous:Anonymous" | grep "r" &>/dev/null && echo -e "\033[32m [+] [Creds: Anonymous:Anonymous ] \033[0m $l " && echo "$1" >> allowed-ftp-vulnerable || echo -e "\033[31m [+] [Creds: Nothing Found ]  \033[0m $l"
done
echo ""

echo -e "\033[32m [+] \033[0m Vaild Output saved on $(pwd)/allowed-ftp-vulnerable"
