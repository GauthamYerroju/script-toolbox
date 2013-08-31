#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <WinAPI.au3>
#include <Constants.au3>

; Playback Control
HotKeySet("#{PGDN}", "_next")
HotKeySet("#{PGUP}", "_prev")
HotKeySet("#{ENTER}", "_play_pause")

; Volume Control
HotKeySet("#{]}", "_vol_up")
HotKeySet("#{[}", "_vol_down")
HotKeySet("#{BACKSPACE}", "_vol_mute")

; Set on top
HotKeySet("#y", "_on_top_toggle")

; Window Grid Size
;HotkeySet("{NUMPAD0 down}", "test1")
;HotkeySet("{NUMPAD0 up}", "test2")

Func test1()
   ToolTip("DOWN...")
EndFunc

Func test2()
   ToolTip("Release!")
   Sleep(1000)
   ToolTip()
EndFunc

; The functionality

Func _on_top_toggle()
   $hActiveWin = WinGetHandle("[ACTIVE]")
   $aWinPos = WinGetPos("[ACTIVE]")
   If BitAND(_WinAPI_GetWindowLong($hActiveWin, $GWL_EXSTYLE), $WS_EX_TOPMOST) Then
	  WinSetOnTop("[ACTIVE]", "", 0)
	  ToolTip("Press Win+Y to toggle.", $aWinPos[0]+$aWinPos[2]/2, $aWinPos[1]+24, "Always on top: Disabled", 1, 2)
	  Sleep(1500)
	  ToolTip("")
   Else
	  WinSetOnTop("[ACTIVE]", "", 1)
	  ToolTip("Press Win+Y to toggle.", $aWinPos[0]+$aWinPos[2]/2, $aWinPos[1]+24, "Always on top: Enabled", 2, 2)
	  Sleep(1500)
	  ToolTip("")
   EndIf
EndFunc

Func _play_pause()
   Send("{MEDIA_PLAY_PAUSE}")
   ToolTip("Play/Pause")
   Sleep(1500)
   ToolTip("")
EndFunc

Func _next()
   Send("{MEDIA_NEXT}")
   ToolTip("Next Track")
   Sleep(1500)
   ToolTip("")
EndFunc

Func _prev()
   Send("{MEDIA_PREV}")
   ToolTip("Previous Track")
   Sleep(1500)
   ToolTip("")
EndFunc

Func _vol_up()
   Send("{VOLUME_UP}")
EndFunc

Func _vol_down()
   Send("{VOLUME_DOWN}")
EndFunc

Func _vol_mute()
   Send("{VOLUME_MUTE}")
EndFunc

; The idle loop
While 1
   Sleep(10000)
WEnd