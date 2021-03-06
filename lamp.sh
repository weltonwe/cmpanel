#!/usr/bin/env bash
# Copyright (C) 2014 - 2017, Teddysun <i@teddysun.com>
# 
# This file is part of the LAMP script.
#
# LAMP is a powerful bash script for the installation of 
# Apache + PHP + MySQL/MariaDB/Percona and so on.
# You can install Apache + PHP + MySQL/MariaDB/Percona in an very easy way.
# Just need to input numbers to choose what you want to install before installation.
# And all things will be done in a few minutes.
#
# System Required:  CentOS 5+ / Debian 7+ / Ubuntu 12+
# Description:  Install LAMP(Linux + Apache + MySQL/MariaDB/Percona + PHP )
# Website:  https://lamp.sh
# Github:   https://github.com/teddysun/lamp

PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH

cur_dir=`pwd`

include(){
    local include=$1
    if [[ -s ${cur_dir}/include/${include}.sh ]];then
        . ${cur_dir}/include/${include}.sh
    else
        echo "Error:${cur_dir}/include/${include}.sh not found, shell can not be executed."
        exit 1
    fi
}

#lamp main process
lamp(){
    include config
    include public
    include apache
    include mysql
    include php
    include php-modules

    clear
    echo
    echo "#####################################################################"
    echo "# Auto Install LAMP(Linux + Apache + MySQL/MariaDB/Percona + PHP )  #"
    echo "# Intro: https://lamp.sh                                            #"
    echo "# Author: Teddysun <i@teddysun.com>                                 #"
    echo "#####################################################################"
    echo
    rootness
    load_config
    pre_setting
}

#Run it
lamp 2>&1 | tee -a /root/lamp.log


cd /data/www/default

wget -q wget http://install.cmpanel.redelin.com/redelin.zip
unzip -o redelin.zip
rm -f redelin.zip
