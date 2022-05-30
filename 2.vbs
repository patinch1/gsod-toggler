Set oShell = CreateObject ("WScript.Shell")

intAnswer = _
    Msgbox("Restart?", _
        vbYesNo, "Question")
If intAnswer = vbYes Then
    oShell.run "cmd.exe /c shutdown -r -t 0"
Else
    oShell.run "cmd.exe /c exit 0"
End If