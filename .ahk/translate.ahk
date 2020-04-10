; translate selected text (ENG->PL) and show result in tooltip next to the cursor
; shortcut: left_Alt+a
<!a::
    Translate()
Return

; translate selected text (ENG->PL) and show result in InternetExplorer window
; shortcut: Ctrl+left_Alt+a
^<!a::
    Translate(1)
Return

; translate selected text (DE->ENG) and show result in tooltip next to the cursor
; shortcut: left_Alt+a
<!i::
    Translate_DE_EN()
Return

; translate selected text (DE->ENG) and show result in InternetExplorer window
; shortcut: Ctrl+left_Alt+i
^<!i::
    Translate_DE_EN(1)
Return

getNewestFile(Directory, extention)
{
    local file, date
    Loop, Files, %Directory%\*.%extention%
    {
        if (A_LoopFileTimeCreated>date)
        {
            file := A_LoopFileName
            date := A_LoopFileTimeCreated
        }
    }
    if file
    {
        return file
    }
    else
    {
        return null
    }
}

SetSystemCursor()
{
    IDC_SIZEALL := 32646
    IDC_WAIT := 32514
    CursorHandle := DllCall( "LoadCursor", Uint,0, Int,IDC_WAIT )
    Cursors = 32512,32513,32514,32515,32516,32640,32641,32642,32643,32644,32645,32646,32648,32649,32650,32651
    Loop, Parse, Cursors, `,
    {
        DllCall( "SetSystemCursor", Uint,CursorHandle, Int,A_Loopfield )
    }
}

RestoreCursors()
{
    SPI_SETCURSORS := 0x57
    DllCall( "SystemParametersInfo", UInt,SPI_SETCURSORS, UInt,0, UInt,0, UInt,0 )
}

TranslateBing(visibility := 0)
{
    SetSystemCursor()
    clipboard =
    Send ^c
    ClipWait
    phrase = %clipboard% ;remove formatting
    MouseGetPos X, Y, winID
    text := BingTranslate(phrase, visibility)
    RestoreCursors()
    if !visibility
    {
        ToolTip, %phrase%`n=`n%text%, X, Y
        KeyWait, LButton, D
        if GetKeyState("LControl")
            Clipboard = %text%
        ToolTip,
    }
}

Translate_DE_EN(visibility := 0)
{
    SetSystemCursor()
    clipboard =
    Send ^c
    ClipWait
    phrase = %clipboard% ;remove formatting
    MouseGetPos X, Y, winID
    text := GoogleTranslate_DE_EN(phrase, visibility)
    RestoreCursors()
    if !visibility
    {
        ToolTip, %phrase%`n=`n%text%, X, Y
        KeyWait, LButton, D
        if GetKeyState("LControl")
            Clipboard = %text%
        ToolTip,
    }
}

Translate(visibility := 0)
{
    SetSystemCursor()
    clipboard =
    Send ^c
    ClipWait
    phrase = %clipboard% ;remove formatting
    MouseGetPos X, Y, winID
    text := GoogleTranslate(phrase, visibility)
    RestoreCursors()
    if !visibility
    {
        ToolTip, %phrase%`n=`n%text%, X, Y
        KeyWait, LButton, D
        if GetKeyState("LControl")
            Clipboard = %text%
        ToolTip,
    }
}

BingTranslate(phrase, visibility)
{
    SetTimer, Reload_hotkey_label, -5000
    Result =
    base := "http://www.bing.com/translator/?text="
    LangIn := "en"
    LangOut := "pl"
    phraseR := StrReplace(phrase, " ", "`%20")
    phraseR2 := StrReplace(phraseR, "`r`n", "`%0A")
    path := base . phraseR2 . "&from=" . LangIn . "/" . "&to=" . LangOut
    IE := ComObjCreate("InternetExplorer.Application")
    IE.Navigate(path)
    While IE.readyState!=4 || IE.document.readyState!="complete" || IE.busy
            Sleep 50
    Result := IE.document.getElementsByClassName("t_txtoutblk")
    If  visibility
    {
        IE.Visible := true
    }
    Else If !Result & !visibility
    {
        IE.Quit
        ; try one more time
        IE := ComObjCreate("InternetExplorer.Application")
        IE.Navigate(path)
        While IE.readyState!=4 || IE.document.readyState!="complete" || IE.busy
                Sleep 50
        Result := IE.document.getElementsByClassName("t_txtoutblk")
        ; if result not obtained, show IE application
        If !Result
        {
            SetTimer, Reload_hotkey_label, Delete
            IE.Visible := true
            MsgBox Result wasn't obtained. Continue?
        }
        else
        {
            IE.Quit
        }
    }
    SetTimer, Reload_hotkey_label, Delete
    return Result
}

GoogleTranslate_DE_EN(phrase, visibility)
{
    SetTimer, Reload_hotkey_label, % TRANSLATION_TIMEOUT_MS
    Result =
    base := "https://translate.google.pl/#"
    LangIn := "de"
    LangOut := "en"
    phraseR := StrReplace(phrase, " ", "`%20")
    phraseR2 := StrReplace(phraseR, "`r`n", "`%0A")
    path := base . LangIn . "/" . LangOut . "/" . phraseR2
    IE := ComObjCreate("InternetExplorer.Application")
    IE.Navigate(path)
    While IE.readyState!=4 || IE.document.readyState!="complete" || IE.busy
            Sleep 50
    Result := IE.document.getElementsByClassName("tlid-translation translation")[0].innertext
    If  visibility
    {
        IE.Visible := true
    }
    Else If !Result & !visibility
    {
        IE.Quit
        ; try one more time
        IE := ComObjCreate("InternetExplorer.Application")
        IE.Navigate(path)
        While IE.readyState!=4 || IE.document.readyState!="complete" || IE.busy
                Sleep 50
        Result := IE.document.getElementsByClassName("tlid-translation translation")[0].innertext
        ; if result not obtained, show IE application
        If !Result
        {
            SetTimer, Reload_hotkey_label, Delete
            IE.Visible := true
            MsgBox Result wasn't obtained. Continue?
        }
        else
        {
            IE.Quit
        }
    }
    SetTimer, Reload_hotkey_label, Delete
    return Result
}

GoogleTranslate(phrase, visibility)
{
    SetTimer, Reload_hotkey_label, -5000
    Result =
    base := "https://translate.google.pl/#"
    LangIn := "en"
    LangOut := "pl"
    phraseR := StrReplace(phrase, " ", "`%20")
    phraseR2 := StrReplace(phraseR, "`r`n", "`%0A")
    path := base . LangIn . "/" . LangOut . "/" . phraseR2
    IE := ComObjCreate("InternetExplorer.Application")
    IE.Navigate(path)
    While IE.readyState!=4 || IE.document.readyState!="complete" || IE.busy
            Sleep 50
    Result := IE.document.getElementsByClassName("tlid-translation translation")[0].innertext
    If  visibility
    {
        IE.Visible := true
    }
    Else If !Result & !visibility
    {
        IE.Quit
        ; try one more time
        IE := ComObjCreate("InternetExplorer.Application")
        IE.Navigate(path)
        While IE.readyState!=4 || IE.document.readyState!="complete" || IE.busy
                Sleep 50
        Result := IE.document.getElementsByClassName("tlid-translation translation")[0].innertext
        ; if result not obtained, show IE application
        If !Result
        {
            SetTimer, Reload_hotkey_label, Delete
            IE.Visible := true
            MsgBox Result wasn't obtained. Continue?
        }
        else
        {
            IE.Quit
        }
    }
    SetTimer, Reload_hotkey_label, Delete
    return Result
}

Reload_hotkey_label:
    MsgBox timeout 5000 miliseconds elapsed
    RestoreCursors()
    Reload
    IE.Quit
return
