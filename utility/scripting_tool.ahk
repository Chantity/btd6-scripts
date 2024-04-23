#Requires AutoHotkey v2.0

; by Chantity

actions := ""
towerPositions := []

6:: {
    A_Clipboard := SubStr(actions, 3) ;remove the first comma and space before putting to clipboard
    MsgBox("Actions copied to clipboard")
}

7:: {
    MsgBox("place action started; will continue once you leftclick on your tower position")
    KeyWait "LButton", "D"
    mouseX := 0
    mouseY := 0
    MouseGetPos(&mouseX, &mouseY)
    towerInput := InputBox("Enter the tower name: ", "Place | Scripting Tool by Chantity")
    if(towerInput.result == "OK" && towerInput.value != "") {
        upgrades := calcUpgrades(InputBox("Enter the upgrade sequence (using 1, 2, 3): ", "Place | Scripting Tool by Chantity").value)
        global actions .= ", {`n`taction: `"place`",`n`ttower: `"" . towerInput.value . "`",`n`tcoords: [" . mouseX . ", " . mouseY . "],`n`ttest: false,`n`ttestColor: `"0xFFFFFF`",`n`ttargetting: 0,`n`tupgrades: [" . upgrades . "]`n}"
        towerPositions.Push([towerInput.value, mouseX, mouseY])
    } else {
        ToolTip("Place Action aborted")
        SetTimer () => ToolTip(), -2500
    }
}

8:: {
    mouseX := 0
    mouseY := 0
    MouseGetPos(&mouseX, &mouseY)
    towerInput := InputBox("Enter the tower name: ", "Sell | Scripting Tool by Chantity")
    tower := findClosestTower(mouseX, mouseY, towerInput.value)
    if(towerInput.result == "OK" && tower.index != 0) {
        global actions .= ", {`n`t;" . towerInput.value . "`n`taction: `"sell`",`n`tcoords: [" . tower.coords[1] . ", " . tower.coords[2] "]`n}"
    } else {
        ToolTip("Sell Action aborted")
        SetTimer () => ToolTip(), -2500
    }
}

9:: {
    mouseX := 0
    mouseY := 0
    MouseGetPos(&mouseX, &mouseY)
    towerInput := InputBox("Enter the tower name: ", "Upgrade | Scripting Tool by Chantity")
    if(towerInput.result == "OK") {
        tower := findClosestTower(mouseX, mouseY, towerInput.value)
        if(tower.index != 0) {
            upgrades := calcUpgrades(InputBox("Enter the upgrade sequence (using 1, 2, 3): ", "Upgrade | Scripting Tool by Chantity").value)
            global actions .= ", {`n`t;" . towerInput.value . "`n`taction: `"upgrade`",`n`tcoords: [" . tower.coords[1] . ", " . tower.coords[2] . "],`n`tupgrades: [" . upgrades . "]`n}"
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

/**
 * 
 * @returns \{index: int, coords: [int, int]}
 */
findClosestTower(x, y, tower) {
    returnDistance := 100.0
    returnCoords := []
    returnIndex := 0
    for currentIndex, pos in towerPositions {
        if(pos[1] == tower) {
            vector := [x-pos[2], y-pos[3]] ;converting the two points (mouse position to tower position) into a vector
            tempDistance := Sqrt((vector[1]*vector[1])+(vector[2]*vector[2])) ;vector length
            ToolTip("distance to closest " . tower . " [px]:" . Integer(tempDistance*100)/100) ;only 2 decimal places
            SetTimer () => ToolTip(), -2500
            if(tempDistance < returnDistance) {
                returnCoords := [pos[2], pos[3]]
                returnIndex := currentIndex
            }
        }
    }
    return {index: returnIndex, coords: returnCoords}
}