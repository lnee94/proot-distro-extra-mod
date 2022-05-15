# proot-distro-extra-mod
A mod for proot-distro to add a vnc server and audio

All this is for right now is a shell script but if this patch https://github.com/termux/proot-distro/pull/218 goes thoure
then it will be directly intergrated in to proot-distro.

How to install 
first install from fdriod termux termux-api and any type of vnc viewer:
seccent run this in termux:
`curl -s https://raw.githubusercontent.com/lnee94/proot-distro-extra-mod/main/tabux.sh | bash` (note you will need to input stuff like a vnc password or time zone)


now it is installed
to run do
(in termux)`startall`
(not in termux)in the vnc viewer go to `localhost:1`
