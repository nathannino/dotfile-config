
# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

eval $(gnome-keyring-daemon --start)
export SSH_AUTH_SOCK
export VK_ICD_FILENAMES /usr/share/vulkan/icd.d/nvidia_icd.json

picom &
nitrogen --restore &
blueman-applet &
dunst &
# trayer --edge top --align right --SetDockType true --SetPartialStrut true --expand true --width 10 --transparent true --tint 0x5f5f5f --height 24 &
xsetroot -cursor_name left_ptr &
flameshot &
numlockx &
xset dpms 3600 3600 3600 &
xset s 3600 3600 &
exec xmonad
# xbindkeys &
# exec dwm
