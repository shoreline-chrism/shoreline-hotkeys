; Shoreline Media Hotkeys
; AutoHotkey Version: 1.x
; Language:       English
; Platform:       Windows
; Author:         Chris Matthias | chris@shoreline.media

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
;SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#Persistent  ; Keep the script running until the user exits it.
;#NoTrayIcon
;WinSet, Transparent, 255, ahk_class Shell_TrayWnd
DetectHiddenWindows, On

/**
 VARIABLES
*/

SL9WindowTitleEmail := Shoreline Media Marketing Mail

/**
 FUNCTIONS
*/

SL9OpenAppURL(MyWin, url, AppOpen:=false)
; To open with app window, pass 3rd param
{
  ;SetTitleMatchMode 2
  SetTitleMatchMode,RegEx
  IfWinExist, %MyWin%
  {
    WinActivate  ; Automatically uses the window found above.
    ;WinMaximize  ; same
  }
  else
  {
    if AppOpen
      Run, chrome.exe --app=%url%
    else
    {
      Run, chrome.exe %url%
      WinWait %MyWin%
      WinMaximize %MyWin%
    }
  }
}

/**
 TRAY MENU
*/
Menu, tray, NoStandard ; Wipe standard menu items
Menu, tray, icon, shoreline-icon.ico
Menu, tray, tip, Shoreline Media Marketing
Menu, tray, add, Hotkey Help, HandlerHelp
Menu, tray, add
Menu, tray, add, Gmail (1), HandlerGMail
Menu, tray, add, Slack (2), HandlerSlack
Menu, tray, add, Hangouts (3), HandlerHangouts
Menu, tray, add, Tasks (4), HandlerTasks
Menu, tray, add, Client Portal (4), HandlerClientPortal
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
#!NumPad1::
#!1::
SL9OpenAppURL("Shoreline Media Marketing Mail", "https://mail.google.com/a/shorelinemedianj.com", true)
return

; Slack
#!NumPad2::
#!2::
SL9OpenAppURL("Slack", "https://shorelinemedia.slack.com", true)
return

; Hangouts
#!NumPad3::
#!3::
SL9OpenAppURL("Hangouts", "https://hangouts.google.com/hangouts/_/shorelinemedianj.com/")
return

; Tasks
#!NumPad4::
#!4::
SL9OpenAppURL("Tasks", "https://app.asana.com")
return

; Tasks
#!NumPad5::
#!5::
SL9OpenAppURL("Social Dashboard", "http://client.shorelinemediamarketing.com/")
return

/**
 MENU HELPERS
*/

HandlerGMail:
;MsgBox You selected %A_ThisMenuItem% from menu %A_ThisMenu%.
SL9OpenAppURL("Shoreline Media Marketing Mail", "https://mail.google.com/a/shorelinemedianj.com", true)
return

HandlerHelp:
SL9OpenAppURL("Hotkeys", "https://shoreline-chrism.github.io/shoreline-hotkeys/")
return

HandlerTasks:
SL9OpenAppURL("Tasks", "https://app.asana.com")
return

HandlerHangouts:
SL9OpenAppURL("Hangouts", "https://hangouts.google.com/hangouts/_/shorelinemedianj.com/")
return

HandlerSlack:
SL9OpenAppURL("Slack", "https://shorelinemedia.slack.com", true)
return

HandlerClientPortal:
SL9OpenAppURL("Social Dashboard", "http://client.shorelinemediamarketing.com/")
return

/**
  HOTSTRINGS / TEXT EXPANSION
*/
; GIT
:oc:gc::git commit -am "" ;
:gp:gp::git push origin master  ;
:oc:gr kleo::git remote add original git@bitbucket.org:shorelinemedia/kleo-base-theme.git	;
:oc:gr shoreline::git remote add origin git@bitbucket.org:shorelinemedia/	;

; VAGRANT
:oc:vu::cd ~/vagrant-local/ && vagrant up	;

; WP CLI
:oc:wpsr::wp search-replace '' '' --skip-columns=guid --recurse-objects=guid --all-tables --dry-run	;
