#Requires AutoHotkey v2.0

; script by Chantity

; works in 36.1

search(x, y, color) {
    px := 0
    py := 0
    loop {
        if (PixelSearch(&px, &py, x, y, x, y, color, 10)) {
            Sleep(250)
            Click
        } else {
            Sleep(250)
            ; MouseMove(x, y)
        }
    }
}

8:: {
    MsgBox("Veteran Collector Enabled", "Start", "0x0")
    search(669, 267, 0x6500BD)
}


9:: {
    MsgBox("Veteran Collector Reloaded", "Reload", "0x0")
    ExitApp
}

0:: {
    MsgBox("Veteran Collector Stopped", "Exit", "0x0")
    ExitApp
}