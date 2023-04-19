#Requires AutoHotkey v2.0

; by Chantity

6:: {
    mouseX := 0
    mouseY := 0
    MouseGetPos(&mouseX, &mouseY)
    tower := InputBox("Enter the tower name: ", "Place | Scripting Tool by Chantity")
    A_Clipboard := ", {`n`taction: `"place`",`n`ttower: `"" . tower.value . "`",`n`tcoords: [" . mouseX . ", " . mouseY . "],`n`ttest: false,`n`ttestColor: `"0xFFFFFF`",`n`ttargetting: 0,`n`tupgrades: [ ]`n}"
}

7:: {
    tower := InputBox("Enter the tower name: ", "Sell | Scripting Tool by Chantity")
    A_Clipboard := ", {`n`t;" . tower.value . "`n`taction: `"sell`",`n`tcoords: [%FILL IN YOUR COORDS%]`n}"
}

8:: {
    tower := InputBox("Enter the tower name: ", "Upgrade | Scripting Tool by Chantity")
    A_Clipboard := ", {`n`t;" . tower.value . "`n`taction: `"upgrade`",`n`tcoords: [%FILL IN YOUR COORDS%],`n`tupgrades: [ ]`n}"
}

9:: {
    A_Clipboard := "{path: 2, amount: 1}"
}

0:: {
    MsgBox("Scripting Tool Stopped", "Exit", "0x0")
    exitapp
}