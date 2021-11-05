# How to use this repo
###### Yeah, because I **will** forget about it later... =/

Source : https://dev.to/nimai/yet-another-guide-on-backing-up-dotfiles-3be6

But, if that link is down...

## Dependencies
Some files try to run programs... probably a good idea to have thoses (They are pretty much all inside .bashrc or .bash\_profile

- `Any version of the jdk after jdk16` --> For the javac16 shortcut used in school
- `neofetch` --> This is the cool litle thing that appears when opening the terminal
- `x11-ssh-askpass` --> There in case a graphical program NEEDS to have elevated privileges.

## Preparing system
**This repo will have conflicts with any setup**
Simply remove/backup any duplicate dotfile from your system.

Example (using .bashrc)
```
rm .bashrc
```
The local copy shouldn't have anything important that isn't in the repo

## Import dotfiles
```
git init --bare "$HOME/dotconfig/.git/"
dotcfg() { git --git-dir="$HOME/dotconfig/.git/" --work-tree="$HOME" "$@" ; }
dotcfg config --local status.showUntrackedFiles no
dotcfg remote add origin https://github.com/nimaipatel/dotfiles.git
dotcfg pull origin master
```

**Note : Some files have hardcoded stuff that could be different on other systems.**
- .xmonad/xmobarrc		--> Updates are set to run /home/nathan\_nino/.xmonad/get\_yay\_update.sh
  - How to fix : Change "nathan\_nino" to be the name of your user profile

# How to add a dotfile
This is a git repo, and dotcfg is just a git alias with some default flags
```
dotcfg add <dotfile>
dotcfg commit -m <commit message>
dotcfg push origin main
```
