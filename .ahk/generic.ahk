; activate or run GVIM instance
; shortcut: left_Alt+v
<!v::
    If WinExist("ahk_exe gvim.exe")
    {
        WinActivate
    }
    else
    {
        If (GVIM_EXE_PATH && GVIM_START_IN_DIR_PATH)
        {
            If FileExist(GVIM_EXE_PATH)
            {
                If InStr(FileExist(GVIM_START_IN_DIR_PATH), "D")
                {
                    Run, %GVIM_EXE_PATH%,  %GVIM_START_IN_DIR_PATH%, Max
                    WinWait, ahk_exe gvim.exe
                    WinActivate, ahk_exe gvim.exe
                }
            }
        }
        else
        {
            MsgBox,
                (
                 Please define the following variables/paths in your personal.ahk file:
                 GVIM_EXE_PATH
                 GVIM_START_IN_DIR_PATH
                )
        }
    }
Return

; switch Excel sheets like the tabs in Chrome browser
; shortcut: Ctrl+[Shift+]Tab
#IfWinActive ahk_exe EXCEL.EXE
 ^Tab:: 	Send, ^{PgDn}
 ^+Tab:: Send, ^{PgUp}
#IfWinActive

; reaload current AHK script
; shortcut: right_Ctrl+right_Shift+r
>^>+r::
    RestoreCursors()
    MsgBox AHK script reloading successfully initialized!
    Reload
    Sleep 1000 ; If successful, the reload will close this instance during the Sleep, so the line below will never be reached.
    MsgBox, 0,, The script could not be reloaded.
Return

; insert current date - the same method as in Excel
; shortcut: Ctrl+;
^;::
Send, %A_YYYY%-%A_MM%-%A_DD%
Return

; insert current time - the same as in Excel
; shortcut: Ctrl+Shift+;
^+;::
Send, %A_Hour%:%A_Min%
Return

; convert TEXT to UPPER
; shortcut: Ctrl+Shift+u
^+u::
clipSave := Clipboard
Send, ^x
sleep, 150
StringUpper Clipboard, Clipboard
StringReplace, Clipboard, Clipboard, `r`n, `n, All ;Fix for SendInput sending Windows linebreaks
Send %Clipboard%
Clipboard := clipSave
Return

; convert text to lower
; shortcut: Ctrl+Shift+l
^+l::
clipSave := Clipboard
Send, ^x
sleep, 150
StringLower Clipboard, Clipboard
StringReplace, Clipboard, Clipboard, `r`n, `n, All ;Fix for SendInput sending Windows linebreaks
Send %Clipboard%
Clipboard := clipSave
Return

; open current url from Chrome in Internet Explorer browser
; shortcut: Ctrl+Shift+o
#IfWinActive ahk_exe chrome.exe
^+o::
    Send ^l
    Sleep, 100
    Send ^c
    Sleep, 100
    Run, iexplore.exe %clipboard%
return
#IfWinActive

; Show InputBox for FILMWEB database searching
; shortcut: left_Alt+F3
<!f3::
InputBox, UserInput, Wyszukiwanie FILMWEB, Podaj nazwe filmu do wyszukania w bazie FILMWEB, , 320, 240
if ErrorLevel
    return
else
    UserInput := StrReplace(UserInput, A_Space, "%20")
    run https://www.filmweb.pl/search?q="%UserInput%"
return
