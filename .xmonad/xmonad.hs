import XMonad -- How to change config : https://xmonad.org/TUTORIAL.html

import XMonad.Util.EZConfig -- Kinda for stuff like keybindings... [View docs for cheatsheet]
import XMonad.Util.Ungrab
import XMonad.Util.Loggers

import XMonad.Config.Desktop

import XMonad.Actions.Promote
import XMonad.Util.Run
import XMonad.Util.SpawnOnce

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
	. xmobarProp 
	. withEasySB (statusBarProp "xmobar ~/.xmonad/xmobarrc" (pure myXmobarPP)) defToggleStrutsKey --  Keybindings at : https://xmonad.org/TUTORIAL.html#changing-what-xmonad-sends-to-xmobar
	. Hacks.javaHack 
	$ myConfig -- See end of file


-- Xmobar pretty printer
myXmobarPP :: PP
myXmobarPP = def
	{ ppSep			= magenta " . "
	, ppTitleSanitize	= xmobarStrip
	, ppCurrent		= wrap " " "" . xmobarBorder "Top" "#8be9fd" 2
	, ppHidden		= white . wrap " " ""
	, ppHiddenNoWindows	= lowWhite . wrap " " ""
	, ppUrgent		= red . wrap (yellow "!") (yellow "!")
	, ppOrder		= \[ws, l, _, wins] -> [ws, l, wins]
	, ppExtras		= [logTitle]
	}
	where
		formatFocused	= wrap (white		"[") (white	"]") . magenta 	. ppWindow
		formatUnfocused	= wrap (lowWhite	"[") (lowWhite	"]") . blue 	. ppWindow

		-- Limit name to sane lenght
		ppWindow :: String -> String
		ppWindow = xmobarRaw . (\w -> if null w then "untitled window" else w) -- . shorten 30

		blue, lowWhite, magenta, red, white, yellow :: String -> String
		magenta	 = xmobarColor "#ff79c6" ""
		blue	 = xmobarColor "#bd93f9" ""
		white	 = xmobarColor "#f8f8f2" ""
		yellow	 = xmobarColor "#f1fa8c" ""
		red	 = xmobarColor "#ff5555" ""
		lowWhite = xmobarColor "#bbbbbb" ""

-- Custom configuration stuff

myManageHook :: ManageHook --Deal with stuff like floating windows
myManageHook = composeAll
	[ isDialog		--> doFloat
	]

myTerminal = "alacritty" --Since we are using the terminal in other places

-- Set configuration
myConfig = def
	{ modMask	= mod1Mask	-- Change this to mod4 when switching to main pc
	, terminal	= myTerminal	-- Set the terminal
	, manageHook = myManageHook	-- Deal with windows (Make some floating)
	}
	`additionalKeysP` -- Add keybinds
	[ ("M-S-m"		, promote)
	, ("M-<Return>"		, spawn $ myTerminal) 
	, ("M-S-<Return>"	, spawn "dmenu_run")
	, ("M-S-z"		, spawn "firefox --new-window")
	]
	
