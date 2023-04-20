#Requires AutoHotkey v2.0

; by Chantity

actions := ""
towerPositions := []

6:: {
    A_Clipboard := SubStr(actions, 3)
    MsgBox("Actions copied to clipboard")
    ; ToolTip("lol")
}

7:: {
    mouseX := 0
    mouseY := 0
    MouseGetPos(&mouseX, &mouseY)
    tower := InputBox("Enter the tower name: ", "Place | Scripting Tool by Chantity")
    if(tower.result == "OK") {
        upgrades := calcUpgrades(InputBox("Enter the upgrade sequence (using 1, 2, 3): ", "Place | Scripting Tool by Chantity").value)
        global actions .= ", {`n`taction: `"place`",`n`ttower: `"" . tower.value . "`",`n`tcoords: [" . mouseX . ", " . mouseY . "],`n`ttest: false,`n`ttestColor: `"0xFFFFFF`",`n`ttargetting: 0,`n`tupgrades: [" . upgrades . "]`n}"
        towerPositions.Push([tower.value, mouseX, mouseY])
    } else {
        ToolTip("Upgrade Action aborted")
        SetTimer () => ToolTip(), -2500
    }
}

8:: {
    mouseX := 0
    mouseY := 0
    MouseGetPos(&mouseX, &mouseY)
    tower := InputBox("Enter the tower name: ", "Sell | Scripting Tool by Chantity")
    if(tower.result == "OK") {
        towerIndex := findClosestTower(mouseX, mouseY, tower.value)
        
        if(towerIndex != 0) {
            global actions .= ", {`n`t;" . tower.value . "`n`taction: `"sell`",`n`tcoords: [" . towerPositions[towerIndex][2] . ", " . towerPositions[towerIndex][3] "]`n}"
            towerPositions.RemoveAt(towerIndex)
        } else {
            MsgBox("Couldn't find tower; Action aborted")
        }
    } else {
        ToolTip("Sell Action aborted")
        SetTimer () => ToolTip(), -2500
    }
}

9:: {
    mouseX := 0
    mouseY := 0
    MouseGetPos(&mouseX, &mouseY)
    tower := InputBox("Enter the tower name: ", "Upgrade | Scripting Tool by Chantity")
    if(tower.result == "OK") {
        towerIndex := findClosestTower(mouseX, mouseY, tower.value)
        if(towerIndex != 0) {
            upgrades := calcUpgrades(InputBox("Enter the upgrade sequence (using 1, 2, 3): ", "Upgrade | Scripting Tool by Chantity").value)
            global actions .= ", {`n`t;" . tower.value . "`n`taction: `"upgrade`",`n`tcoords: [" . towerPositions[towerIndex][2] . ", " . towerPositions[towerIndex][3] . "],`n`tupgrades: [" . upgrades . "]`n}"
        } else {
            MsgBox("Couldn't find tower; Action aborted")
        }
    } else {
        ToolTip("Upgrade Action aborted")
        SetTimer () => ToolTip(), -2500
    }
}

0:: {
    MsgBox("Scripting Tool Stopped", "Exit", "0x0")
    exitapp
}

calcUpgrades(upgrades) {
    if(upgrades != "") {
        returnString := ""
        lastUpgrade := ""
        currentUpgradeAmount := 0
        loop parse upgrades {
            if(lastUpgrade == A_LoopField) {
                currentUpgradeAmount := currentUpgradeAmount + 1
            } else {
                if(lastUpgrade == "") {
                    lastUpgrade := A_LoopField
                    currentUpgradeAmount := 1
                } else {
                    if(returnString = "") {
                    returnString := "`n`t`t{path: " . lastUpgrade . ", amount: " . currentUpgradeAmount . "}"
                    } else {
                        returnString := returnString . ",`n`t`t{path: " . lastUpgrade . ", amount: " . currentUpgradeAmount . "}"
                    }
                    lastUpgrade := A_LoopField
                    currentUpgradeAmount := 1
                }
            }
        }
        if(returnString = "") {
            returnString := "`n`t`t{path: " . lastUpgrade . ", amount: " . currentUpgradeAmount . "}`n`t"
        } else {
            returnString .= ",`n`t`t{path: " . lastUpgrade . ", amount: " . currentUpgradeAmount . "}`n`t"
        }
        return returnString
    } else {
        return " "
    }
}

findClosestTower(x, y, tower) {
    distance := 100.0
    coords := []
    index := 0
    for currentIndex, pos in towerPositions {
        if(pos[1] == tower) {
            vector := [x-pos[2], y-pos[3]] ;converting the two points into a vector
            tempDistance := Sqrt((vector[1]*vector[1])+(vector[2]*vector[2])) ;vector length
            MsgBox(tempDistance)
            if(tempDistance < distance) {
                coords := [pos[2], pos[3]]
                index := currentIndex
            }
        }
    }
    return index
}