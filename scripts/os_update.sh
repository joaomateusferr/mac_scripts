#!/bin/bash

ERASE_VOLUME=$1

if [ -z $ERASE_VOLUME ];then
    echo 'Please, use the scripts argument:'
    echo 'ERASE_VOLUME (1 or 0)'
    exit 1
fi

#https://osxdaily.com/2020/04/13/how-download-full-macos-installer-terminal/
softwareupdate --download --fetch-full-installer --full-installer-version 10.13.6 
exit

APP_NAME='Install macOS Catalina.app'
APP_NAME_PATH=${APP_NAME// /\\ }
COMMAND="/Applications/$APP_NAME_PATH/Contents/Resources/startosinstall"

if [ $ERASE_VOLUME -eq 1 ]; then
    PARAMETERS='--agreetolicense --eraseinstall --newvolumename "Macintosh HD" --nointeraction'
else
    PARAMETERS='--agreetolicense --nointeraction'
fi

eval $COMMAND $PARAMETERS