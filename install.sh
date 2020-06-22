#!/bin/bash

# MIT License
#
# Copyright (C) 2020, Entynetproject. All Rights Reserved.
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

printf '\033]2;install.sh\a'

G="\033[1;34m[*] \033[0m"
S="\033[1;32m[+] \033[0m"
E="\033[1;31m[-] \033[0m"

if [[ $(id -u) != 0 ]]
then
   echo -e ""$E"Permission denied!"
   exit
fi

{
ASESR="$(ping -c 1 -q www.google.com >&/dev/null; echo $?)"
} &> /dev/null
if [[ "$ASESR" != 0 ]]
then 
   echo -e ""$E"No Internet connection!"
   exit
fi

sleep 0.5
clear
sleep 0.5
echo
cat banner/banner.txt
echo

sleep 1
echo -e ""$G"Instalando dependecnias..."
sleep 1

{
pkg update
pkg -y install git
pkg -y install python
apt-get update
apt-get -y install git
apt-get -y install https://github.com/Tandelajr/mr.tandela
apt-get -y install https://github.com/Tandelajr/mr.tandela-pip
apk update
apk add git
apk add https://github.com/Tandelajr/mr.tandela
apk add py3-pip
pacman -Sy
pacman -S --noconfirm git
pacman -S --noconfirm https://github.com/Tandelajr/mr.tandela
pacman -S --noconfirm https://github.com/Tandelajr/mr.tandela-pip
zypper refresh
zypper install -y git
zypper install -y https://github.com/Tandelajr/mr.tandela
zypper install -y https://github.com/Tandelajr/mr.tandela-pip
yum -y install git
yum -y install https://github.com/Tandelajr/mr.tandela
yum -y install https://github.com/Tandelajr/mr.tandela-pip
dnf -y install git
dnf -y install https://github.com/Tandelajr/mr.tandela
dnf -y install https://github.com/Tandelajr/mr.tandela-pip
eopkg update-repo
eopkg -y install git
eopkg -y install https://github.com/Tandelajr/mr.tandela
eopkg -y install pip
xbps-install -S
xbps-install -y git
xbps-install -y https://github.com/Tandelajr/mr.tandela
xbps-install -y https://github.com/Tandelajr/mr.tandela-pip
} &> /dev/null

if [[ -d ~/quack ]]
then
sleep 0
else
cd ~
{
git clone https://github.com/Tandelajr/mr.tandela
} &> /dev/null
fi

if [[ -d ~/quack ]]
then
cd ~/quack
else
echo -e ""$E"Instalação falhou!"
exit
fi

{
https://github.com/Tandelajr/mr.tandela -m pip install setuptools
https://github.com/Tandelajr/mr.tandela -m pip install -r requirements.txt
} &> /dev/null

{
cd bin
cp quack /usr/local/bin
chmod +x /usr/local/bin/quack
cp quack /bin
chmod +x /bin/quack
cp quack /data/data/com.termux/files/usr/bin
chmod +x /data/data/com.termux/files/usr/bin/quack
} &> /dev/null

sleep 1
echo -e ""$S"Instalação Bem Sucedida!"
sleep 1
