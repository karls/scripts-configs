-- Imports.
import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.StackSet as W
import XMonad.Hooks.SetWMName
import XMonad.Layout.Grid
import XMonad.Layout.IM
import XMonad.Layout.PerWorkspace
import XMonad.Actions.CycleWS
import XMonad.Layout.NoBorders
import XMonad.Prompt
import XMonad.Prompt.Shell
import XMonad.Actions.GridSelect
import qualified Data.Map as M
import Data.Ratio ((%))

-- The main function.
main = xmonad =<< statusBar myBar myPP toggleStrutsKey myConfig

-- Command to launch the bar.
myBar = "xmobar"

-- Custom PP, configure it as you like.
-- It determines what's being written to the bar.
myPP = xmobarPP { ppCurrent = xmobarColor "#758C5D" "" . wrap "[" "]" }

-- Keybinding to toggle the gap for the bar.
toggleStrutsKey XConfig {XMonad.modMask = modMask} = (modMask, xK_b)

myManageHook = composeAll
	[ className =? "Chromium"          --> doShift "1"
	, className =? "chromium"          --> doShift "1"
	, className =? "Google-chrome"     --> doShift "1"
	, className =? "Chromium-browser"     --> doShift "1"
	, className =? "Thunar"            --> doShift "8"
	, className =? "Nautilus"            --> doShift "8"
	, className =? "Skype"             --> doShift "9"
	, className =? "Pidgin"            --> doShift "9"
	, className =? "Rhythmbox"         --> doShift "8"
	, className =? "Gimp"              --> doFloat
	, className =? "Wicd-client.py"    --> doFloat
	, className =? "Tk"                --> doFloat
	, className =? "Gtkclient.py"      --> doFloat
	, className =? "MPlayer"           --> doFloat
	, className =? "markov-PlotSound"  --> doFloat
	, className =? "markov-PlotLabels" --> doFloat
	, className =? "Exe"               --> doFloat
	, className =? "Python"            --> doFloat
	, className =? "FrameDemo"         --> doFloat
	, title     =? "COMP27112 Exercise 2" --> doFloat	
	, className =? "sun-awt-X11-XFramePeer" --> doFloat
	, className =? "com-mathworks-util-PostVMInit" --> doFloat
	, className =? "RosterEngine" --> doFloat
	, title     =? "Google - Bookmarks - Chromium" --> doFloat
	]

-- "IM" layout (9) has gridIM layout, others have Tall, Mirror, Grid, Full
--myLayouts = onWorkspace "9" (Grid)
--		$ tiled ||| Mirror tiled ||| Grid ||| Full
--		where
--		-- default tiling algorithm partitions the screen into two panes
--		tiled = Tall nmaster delta ratio
--
--		-- The default number of windows in the master pane
--		nmaster = 1
--
--		-- Default proportion of screen occupied by master pane
--		ratio = 1/2
--
--		-- Percent of screen to increment by when resizing panes
--		delta = 3/100

-- this is the old layout from the config on my personal laptop.
myLayouts = onWorkspace "9" (gridIM (1%6) (ClassName "Skype") )
						$ tiled ||| Mirror tiled ||| Grid ||| Full
							where
								tiled = Tall nmaster delta ratio
								nmaster = 1
								ratio = 1/2
								delta = 3/100

newKeys x = M.union (keys defaultConfig x) (M.fromList (myKeys x))

-- Some additional keymappings
myKeys conf@(XConfig {XMonad.modMask = modm}) =
	[
		-- XF86AudioRaiseVolume: master speaker
	  ((0, 0x1008ff13), spawn "amixer set Master 1+")
		
		-- XF86AudioLowerVolume: master speaker
	, ((0, 0x1008ff11), spawn "amixer set Master 1-")
	
		-- XF86AudioMute: mute master
	, ((0, 0x1008ff12), spawn "amixer set Master toggle")
	
		-- XF86AudioPlay: play/pause mpc
--	, ((0, 0x1008ff14), spawn "mpc toggle")
	, ((0, 0x1008ff14), spawn "banshee --toggle-playing")
	
		-- ctrl + XF86AudioRaiseVolume: master speaker +5
	, ((controlMask, 0x1008ff13), spawn "amixer set Master 5+")
	
		-- ctrl + XF86AudioLowerVolume: master speaker -5
	, ((controlMask, 0x1008ff11), spawn "amixer set Master 5-")
	
		-- XF86Suspend: display off
	, ((0, 0x1008ffa7), spawn "sleep 0.3; xset dpms force off")
	
		-- mod + XF86Suspend: suspend
	, ((modm, 0x1008ffa7), spawn "sleep 0.3; sudo pm-suspend")
	
		-- mod + shift + l: lock screen
	, ((modm .|. controlMask, xK_l), spawn "sleep 0.3; xscreensaver-command -lock")
	
		-- XF86AudioNext: next song in playlist
--	, ((0, 0x1008ff17), spawn "mpc next")
	, ((0, 0x1008ff17), spawn "banshee --next")
	
		-- XF86AudioPrev: previous song in playlist
--	, ((0, 0x1008ff16), spawn "mpc prev") 
	, ((0, 0x1008ff17), spawn "banshee --previous")
	
		-- go back to previous desk
	, ((modm, 0xfe5a), toggleWS)
	, ((modm, 0x60), toggleWS)
	
		-- mod + f: make currently focused window floating and in the center
	, ((modm, xK_f), withFocused
									 $ windows . (flip W.float
									 $ W.RationalRect 0.25 0.10 0.5 0.80))
	, ((modm, 0x2d), shellPrompt sPConfig)
	
	, ((modm, xK_g), goToSelected gsConfig)
	
	-- remap some defaults
	-- , ((modm, xK_Return), spawn $ XMonad.terminal conf)
	-- , ((modm .|. shiftMask, xK_Return), windows W.swapMaster)
	]

-- shellPrompt config
sPConfig = defaultXPConfig { position = Top }

gsConfig = defaultGSConfig
	{ gs_cellwidth = 250
	, gs_cellpadding = 10
	}

-- Main configuration, override the defaults to your liking.
--workspaces = ["1:web", "2", "3", "4", "5", "6", "7:files", "8:mpd + irc", "9:im"]
myConfig = defaultConfig
	{ modMask = mod4Mask
	--, Xmonad.workspaces = ["1:web", "2", "3", "4", "5", "6", "7:files", "8:mpd + irc", "9:im"]
	--, terminal = "urxvt -cd $(cat $HOME/.pwd)"
	--, terminal = "gnome-terminal --working-directory=$(cat $HOME/.pwd)"
	, terminal = "xterm -bg black -fg white"
	, focusedBorderColor = "#FF0000"
	, manageHook = myManageHook
	, startupHook = setWMName "LG3D"
	, layoutHook = smartBorders $ myLayouts
	, keys = newKeys
	}
