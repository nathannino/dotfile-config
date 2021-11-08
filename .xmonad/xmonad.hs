import XMonad -- How to change config : https://xmonad.org/TUTORIAL.html

import XMonad.Util.EZConfig -- Kinda for stuff like keybindings... [View docs for cheatsheet]
import XMonad.Util.Ungrab
import XMonad.Util.Loggers

import XMonad.Layout.ToggleLayouts

import XMonad.Config.Desktop

import XMonad.Actions.Promote
import XMonad.Util.Run
import XMonad.Util.SpawnOnce
import XMonad.Prompt.DirExec

import XMonad.Hooks.EwmhDesktops

import qualified XMonad.Util.Hacks as Hacks -- Random, hacky fixes for a few things, including java graphical apps not working

-- Hooks
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.StatusBar
import XMonad.Hooks.StatusBar.PP
import XMonad.Hooks.ManageHelpers

-- Main function, just call other stuff
main :: IO ()
main = xmonad 
        . ewmhFullscreen 
        . ewmh 
        . withEasySB (statusBarProp "xmobar ~/.xmonad/xmobarrc" (pure myXmobarPP)) defToggleStrutsKey --  Keybindings at : https://xmonad.org/TUTORIAL.html#changing-what-xmonad-sends-to-xmobar
        . Hacks.javaHack 
        $ myConfig -- See end of file

-- Xmobar pretty printer
myXmobarPP :: PP
myXmobarPP = def
	{ ppCurrent = yellow . wrap "<box type=Bottom width=3 color=#f9fb07> " " </box>" -- Current workspace in xmobar
	, ppVisible = magenta . wrap "<box type=Bottom width=3 color=#ff79c6> " " </box>" -- Visible workspaces that are not the current workspace
	, ppHidden = lightBlue . wrap " " " " -- Hidden workspaces
	--, ppHiddenNoWindows = lowWhite -- Hidden workspaces, but no windows
	, ppTitle = lightBlue . shorten 60 -- Title of window
	, ppWsSep = ""
	, ppSep = " | " -- Seperator
	, ppUrgent = red . wrap "<box type=Bottom width=3 color=#ff5555> " " </box>" -- Urgent window in workspace
	}
	where -- Color definitions
		blue, lowWhite, magenta, red, white, yellow :: String -> String
		magenta	 = xmobarColor "#ff79c6" "#303030:0"
		blue	 = xmobarColor "#bd93f9" "#424242:0"
		lightBlue= xmobarColor "#d1feff" "#424242:0"
		white	 = xmobarColor "#ffffff" "#424242:0"
		yellow	 = xmobarColor "#f9fb07" "#303030:0"
		red	 = xmobarColor "#ff5555" "#424242:0"
		lowWhite = xmobarColor "#bbbbbb" "#424242:0"

-- Custom configuration stuff

myManageHook :: ManageHook --Deal with stuff like floating windows
myManageHook = composeAll
	[ isDialog		--> doFloat
	]

myTerminal = "alacritty" --Since we are using the terminal in other places
myHome = "/home/nathan_nino/"

-- Set configuration
myConfig = def
	{ modMask	= mod1Mask	-- Change this to mod4 when switching to main pc
	, terminal	= myTerminal	-- Set the terminal
	, manageHook = myManageHook	-- Deal with windows (Make some floating)
	, focusedBorderColor = "#969e00"
	, normalBorderColor = "#000247"
	}
	`additionalKeysP` -- Add keybinds
	[ ("M-S-m"		, promote)
	, ("M-<Return>"		, spawn $ myTerminal) 
	, ("M-S-<Return>"	, spawn "dmenu_run")
	, ("M-S-z"		, spawn "firefox --new-window")
	, ("M-\\"		, spawn $ myHome ++ "/maintenance/xmenu_run")
	]
	
