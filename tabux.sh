#!/bin/bash
#note you will need to install the apps termux, termux-api and some sort of vnc client




DEP="awesome" #desktop envronment
DISTRO="debian"
PREFIX="$(dirname $HOME)/usr"

#basic house keeping for termux
pkg update
pkg upgrade -y
pkg install termux-api

#steps to get a working chroot
pkg install proot-distro -y
proot-distro install $DISTRO
proot-distro login $DISTRO -- bash -c "apt update ;apt upgrade -y;mkdir /scripts"


#steps to get from a chroot to a vnc gui
proot-distro login $DISTRO -- apt install $DEP tightvncserver tightvncpasswd -y
proot-distro login $DISTRO -- tightvncpasswd

#enable pulseaudio aka audio and mic
termux-microphone-record -d # this is to make it so that the mic works

pkg install pulseaudio -y
proot-distro login $DISTRO -- bash -c 'echo "export PULSE_SERVER=127.0.0.1" >> /root/.bashrc'
echo '#29351dda-926f-4d63-9114-bb4cf08fbe3f
load-module module-sles-source
load-module module-null-sink sink_name=virtspk sink_properties=device.description=Virtual_Speaker
load-module module-native-protocol-tcp auth-ip-acl=127.0.0.1 auth-anonymous=1
#29351dda-926f-4d63-9114-bb4cf08fbe3f' >>$PREFIX/etc/pulse/default.pa


#start audio and vnc server
pulseaudio --start
proot-distro login $DISTRO -- bash -c "rm /tmp/.X11-unix/X* /tmp/.X*-lock ;tightvncserver;bash"
