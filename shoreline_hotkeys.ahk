; Shoreline Media Hotkeys
; AutoHotkey Version: 1.x
; Language:       English
; Platform:       Windows
; Author:         Chris Matthias | chris@shoreline.media

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
;SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

/**
 TRAY MENU
*/
#Persistent  ; Keep the script running until the user exits it.
;#NoTrayIcon
;WinSet, Transparent, 255, ahk_class Shell_TrayWnd
DetectHiddenWindows, On
Menu, tray, NoStandard ; Wipe standard menu items
Menu, tray, icon, shoreline-icon.ico
Menu, tray, tip, Shoreline Media Marketing
Menu, tray, add, Hotkey Help, HandlerLaunchHelp
Menu, tray, add
Menu, tray, add, Gmail (1), HandlerGMail
Menu, tray, add
Menu, tray, add, Exit, HandlerExit
return

HandlerExit:
ExitApp
return

/**
 HOTKEYS
*/

; Gmail
NumPad0 & NumPad1::
Run, chrome.exe --app=https://mail.google.com/a/shorelinemedianj.com
WinWait, Gmail
WinMaximize, Gmail
return

HandlerGMail:
Run, chrome.exe --app=https://mail.google.com/a/shorelinemedianj.com
WinWait, Gmail
WinMaximize, Gmail
return

/**
 MENU HELPERS
*/
HandlerHelp:
MsgBox, 1, Hotkey Help, These shortcuts should be used with your right hand on the numberpad of your keyboard.`n`nWhile holding down the numberpad's 0 key`, press the shortcut`'s modifier (ie - +`, 1`, 2`, 3`, etc.) to activate the shortcut.  If you find the hotkeys not working, you should install Google Chrome as your default browser.`n`nPress OK to view the hotkeys or Cancel to close this window.
IfMsgBox, OK
  Run chrome.exe --app=https://shoreline-chrism.github.io/shoreline-hotkeys/
return

HandlerLaunchHelp:
Run, chrome.exe --app=https://shoreline-chrism.github.io/shoreline-hotkeys/
return


/**
  HOTSTRINGS / TEXT EXPANSION
*/
; GIT
:oc:gr kleo::git remote add original git@bitbucket.org:shorelinemedia/kleo-base-theme.git	;
:oc:gr shoreline::git remote add origin git@bitbucket.org:shorelinemedia/	;

; VAGRANT
:oc:vu::cd ~/vagrant-local/ && vagrant up	;

; WP CLI
:oc:wpsr::wp search-replace '' '' --skip-columns=guid --recurse-objects=guid --all-tables --dry-run	;
