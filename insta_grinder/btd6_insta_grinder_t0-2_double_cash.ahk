﻿#Requires AutoHotkey v2.0

; script by Chantity

; works in 36.1

;for nomenclature of special keys visit https://www.autohotkey.com/docs/v2/lib/Send.htm#keynames
;note: when you declare them in the hotkeys section down below,
;use quotation marks instead of curly braces (e.g. "Esc" instead of {Esc}).
;also use quotation marks for everything other than numbers

global hotkeys := {
    towers: {
        ben: "u",
        dart: "q",
        bomb: "e",
        druid: "g",
        sniper: "y",
        sub: "x",
        boat: "c",
        ace: "v",
        heli: "b",
        alch: "f",
        farm: "h",
        village: "k",
        spactory: "j",
        engi: "l"
    },
    functional: {
        targetting: "Tab",
        play: "Space",
        deselect: "Esc",
        sell: "RButton",
        upgrades: {
            1: 1,
            2: 2,
            3: 3
        }
    }
}

; action templates:
; place tower:
; {
;     action: "place",
;     tower: "dart",
;     coords: [326, 218],
;     test: false,
;     testColor: "0xFFFFFF",
;     targetting: 0,
;     upgrades: [] ;leave empty when you want no initial upgrades
;     }

; sell tower:
; {
;     action: "sell",
;     coords: [326, 218]
;     }

; upgrade existing tower:
; {
;     action: "upgrade",
;     coords: [326, 218],
;     upgrades: [
;         {path: 1, amount: 2},
;         {path: 3, amount: 3}
;       ]
;     }

global config := {
    speed: 250,
    staticValues: {
        xCenterWithoutTowerMenu: 556,
        upgradeButtonX: {
            left: 172,
            right: 992
        },
        upgradeButtonY: {
            1: 327,
            2: 426,
            3: 526
        },
        nextPageButton: [1100, 290],
        mapCoords: [
            [435, 197],
            [718, 198],
            [1000, 197],
            [432, 401],
            [716, 409],
            [1000, 408]
        ]
    },
    towers: {
        ben: {
            buyTestCoords: {
                x: 1141,
                y: 182
            }
        },
        dart: {
            buyTestCoords: {
                x: 1220,
                y: 180
            }
        },
        bomb: {
            buyTestCoords: {
                x: 1224,
                y: 265
            }
        }
        ,
        sniper: {
            buyTestCoords: {
                x: 1220,
                y: 442
            }
        },
        sub: {
            buyTestCoords: {
                x: 1142,
                y: 533
            }
        },
        boat: {
            buyTestCoords: {
                x: 1222,
                y: 532
            }
        },
        ace: {
            buyTestCoords: {
                x: 1155,
                y: 622
            }
        },
        heli: {
            buyTestCoords: {
                x: 1225,
                y: 623
            }
        },
        alch: { ;heli price coords
            buyTestCoords: {
                x: 1225,
                y: 623
            }
        },
        druid: { ;ice price coords
            buyTestCoords: {
                x: 1221,
                y: 353
            }
        },
        farm: { ;heli price coords
            buyTestCoords: { ;only use village in your strategy if you already placed a military tower
                x: 1225,
                y: 623
            }
        },
        village: { ;heli price coords
            buyTestCoords: { ;only use village in your strategy if you already placed a military tower
                x: 1225,
                y: 623
            }
        },
        spactory: { ;heli price coords
            buyTestCoords: { ;can be used with military discount ONLY if spike factory discount is also active
                x: 1225,
                y: 623
            }
        },
        engi: { ;ice price coords
            buyTestCoords: {
                x: 1221,
                y: 353
            }
        }
    },
    maps: {
        cubism: {
            gamemode: "impoppable",
            actions: [{
                        action: "place",
                        tower: "dart",
                        coords: [440, 348],
                        test: false,
                        testColor: "0xFFFFFF",
                        targetting: 0,
                        upgrades: [
                            {path: 2, amount: 1}
                        ]
                    }, {
                        action: "place",
                        tower: "ben",
                        coords: [391, 322],
                        test: false,
                        testColor: "0xFFFFFF",
                        targetting: 0,
                        upgrades: []
                    }, {
                        action: "place",
                        tower: "sub",
                        coords: [578, 185],
                        test: false,
                        testColor: "0xFFFFFF",
                        targetting: 150,
                        upgrades: []
                    }, {
                        ;sub
                        action: "sell",
                        coords: [578, 185]
                    }, {
                        action: "place",
                        tower: "farm",
                        coords: [158, 286],
                        test: false,
                        testColor: "0xFFFFFF",
                        targetting: 0,
                        upgrades: []
                    }, {
                        action: "place",
                        tower: "druid",
                        coords: [240, 298],
                        test: false,
                        testColor: "0xFFFFFF",
                        targetting: 0,
                        upgrades: []
                    }, {
                        ;farm
                        action: "upgrade",
                        coords: [158, 286],
                        upgrades: [
                            {path: 1, amount: 2}
                          ]
                    }, {
                        ;druid
                        action: "upgrade",
                        coords: [240, 298],
                        upgrades: [
                            {path: 1, amount: 1},
                            {path: 2, amount: 3}
                          ]
                    }, {
                        ;farm
                        action: "upgrade",
                        coords: [158, 286],
                        upgrades: [
                            {path: 3, amount: 3}
                          ]
                    }, {
                        ;dart
                        action: "upgrade",
                        coords: [440, 348],
                        upgrades: [
                            {path: 2, amount: 1},
                            {path: 3, amount: 3}
                          ]
                    }, {
                        action: "place",
                        tower: "farm",
                        coords: [71, 653],
                        test: false,
                        testColor: "0xFFFFFF",
                        targetting: 0,
                        upgrades: [
                            {path: 1, amount: 2},
                            {path: 3, amount: 3}
                        ]
                    }, {
                        action: "place",
                        tower: "farm",
                        coords: [179, 653],
                        test: false,
                        testColor: "0xFFFFFF",
                        targetting: 0,
                        upgrades: [
                            {path: 1, amount: 2},
                            {path: 3, amount: 3}
                        ]
                    }, {
                        action: "place",
                        tower: "farm",
                        coords: [539, 321],
                        test: false,
                        testColor: "0xFFFFFF",
                        targetting: 0,
                        upgrades: [
                            {path: 1, amount: 2},
                            {path: 3, amount: 3}
                        ]
                    }, {
                        ;farm
                        action: "upgrade",
                        coords: [158, 286],
                        upgrades: [
                            {path: 3, amount: 1}
                          ]
                    }, {
                        action: "place",
                        tower: "village",
                        coords: [381, 231],
                        test: false,
                        testColor: "0xFFFFFF",
                        targetting: 0,
                        upgrades: [
                            {path: 2, amount: 2},
                            {path: 1, amount: 2}
                        ]
                    }, {
                        action: "place",
                        tower: "boat",
                        coords: [538, 222],
                        test: false,
                        testColor: "0xFFFFFF",
                        targetting: 0,
                        upgrades: [
                            {path: 2, amount: 1},
                            {path: 1, amount: 3}
                        ]
                    }, {
                        ;dart
                        action: "sell",
                        coords: [440, 348]
                    }, {
                        action: "place",
                        tower: "farm",
                        coords: [287, 673],
                        test: false,
                        testColor: "0xFFFFFF",
                        targetting: 0,
                        upgrades: [
                            {path: 1, amount: 2},
                            {path: 3, amount: 4}
                        ]
                    }, {
                        ;boat
                        action: "upgrade",
                        coords: [538, 222],
                        upgrades: [
                            {path: 2, amount: 1},
                            {path: 1, amount: 2}
                          ]
                    }, {
                        ;farm
                        action: "upgrade",
                        coords: [179, 653],
                        upgrades: [
                            {path: 3, amount: 1}
                          ]
                    }, {
                        action: "place",
                        tower: "village",
                        coords: [650, 299],
                        test: false,
                            testColor: "0xFFFFFF",
                        targetting: 0,
                        upgrades: [
                            {path: 2, amount: 2},
                            {path: 1, amount: 2}
                        ]
                    }, {
                        ;druid
                        action: "sell",
                        coords: [240, 298]
                    }, {
                        ;village
                        action: "sell",
                        coords: [381, 231]
                    }, {
                        action: "place",
                        tower: "ace",
                        coords: [767, 326],
                        test: false,
                        testColor: "0xFFFFFF",
                        targetting: 0,
                        upgrades: [
                            {path: 1, amount: 2},
                            {path: 3, amount: 5}
                        ]
                    }, {
                        ;farm
                        action: "sell",
                        coords: [539, 321]
                    }, {
                        action: "place",
                        tower: "ace",
                        coords: [539, 321],
                        test: false,
                        testColor: "0xFFFFFF",
                        targetting: 1,
                        upgrades: [
                            {path: 3, amount: 1},
                            {path: 1, amount: 4}
                        ]
                    }, {
                        ;ace
                        action: "upgrade",
                        coords: [539, 321],
                        upgrades: [
                            {path: 1, amount: 1}
                          ]
                    }, {
                        action: "place",
                        tower: "sniper",
                        coords: [760, 200],
                        test: false,
                        testColor: "0xFFFFFF",
                        targetting: 0,
                        upgrades: [
                            {path: 2, amount: 2},
                            {path: 3, amount: 5}
                        ]
                    }, {
                        ;farm
                        action: "sell",
                        coords: [832, 413]
                    }, {
                        ;farm
                        action: "sell",
                        coords: [71, 653]
                    }, {
                        ;farm
                        action: "sell",
                        coords: [179, 653]
                    }, {
                        ;farm
                        action: "sell",
                        coords: [287, 673]
                    }, {
                        ;farm
                        action: "sell",
                        coords: [158, 286]
                    }, {
                        action: "place",
                        tower: "spactory",
                        coords: [124, 158],
                        test: false,
                        testColor: "0xFFFFFF",
                        targetting: 0,
                        upgrades: [
                            {path: 2, amount: 2},
                            {path: 3, amount: 5}
                        ]
                    }, {
                        action: "place",
                        tower: "alch",
                        coords: [256, 140],
                        test: false,
                        testColor: "0xFFFFFF",
                        targetting: 0,
                        upgrades: [
                            {path: 1, amount: 4},
                            {path: 2, amount: 2}
                        ]
                    }, {
                        action: "place",
                        tower: "village",
                        coords: [195, 151],
                        test: false,
                        testColor: "0xFFFFFF",
                        targetting: 0,
                        upgrades: [
                            {path: 1, amount: 2},
                            {path: 2, amount: 2}
                        ]
                    }, {
                        action: "place",
                        tower: "engi",
                        coords: [48, 74],
                        test: false,
                        testColor: "0xFFFFFF",
                        targetting: 0,
                        upgrades: [
                            {path: 1, amount: 2},
                            {path: 3, amount: 5}
                        ]
                    }
            ]}
        }
}


search(x, y, color) {
    px := 0
    py := 0
    loop {
        if (PixelSearch(&px, &py, x, y, x, y, color, 10)) {
            break
        } else {
            sleep(config.speed)
            ; MouseMove(x, y)
        }
    }
}

placeTower(tower, x, y, checkSpot, spotColor) {
    search(config.towers.%tower%.buyTestCoords.x, config.towers.%tower%.buyTestCoords.y, 0xFFFFFF)
    if(checkSpot){
        search(x, y, spotColor)
    }
    MouseMove(x, y)
    sleep(config.speed)
    Send("{" hotkeys.towers.%tower% "}")
    sleep(config.speed)
    Click
    sleep(config.speed)
}

upgradeTower(xPosition, yPosition, upgradePath, upgradeAmount) {
    if (xPosition <= config.staticValues.xCenterWithoutTowerMenu) {
        upgradeMenuSide := "right"
    } else {
        upgradeMenuSide := "left"
    }
    loop(upgradeAmount) {
        ; search(config.staticValues.upgradeButtonX.%upgradeMenuSide%, config.staticValues.upgradeButtonY.%upgradePath%, "0x4DD400")
        search(config.staticValues.upgradeButtonX.%upgradeMenuSide%, config.staticValues.upgradeButtonY.%upgradePath%, "0x50DD00")
        Send("{" hotkeys.functional.upgrades.%upgradePath% "}")
        Sleep(config.speed)
    }
    Sleep(config.speed)
}

selectTower(x, y) {
    MouseMove(x, y)
    sleep(config.speed)
    Click
    sleep(config.speed)
}

changeTargetting(x, y, amount) {
    loop(amount) {
        Send("{" hotkeys.functional.targetting "}")
        sleep(config.speed)
    }
}

/**
 * Starts at the home screen and selects the given map.
 * @param difficulty Map Difficulty (Beginner, Intermediate, Advanced or Expert)
 * @param page Page within that difficulty that the map is on
 * @param mapNumberOnPage Position of the map within that page (top left = 1, bottom right = 6)
 * @param map Name of the map
 * @returns map Name of the map
 */
selectMap(difficulty, page, mapNumberOnPage, map) {
    search(550, 620, 0xFFFFFF) ; play button on home screen
    sleep(config.speed)
    click(550, 620)
    sleep(800)
    if(difficulty == "beginner") {
        click(900, 650) ;expert
        sleep(200)
        loop(page) {
            click(391, 650) ;beginner
            sleep(200)
        }
    } else if(difficulty == "intermediate") {
        click(900, 650) ;expert
        sleep(200)
        loop(page) {
            click(550, 650) ;intermediate
            sleep(200)
        }
    } else if(difficulty == "advanced") {
        click(900, 650) ;expert
        sleep(200)
        loop(page) {
            click(725, 650) ;intermediate
            sleep(200)
        }
    } else if(difficulty == "expert") {
        click(391, 650) ;beginner
        sleep(200)
        loop(page) {
            click(900, 650) ;expert
            sleep(200)
        }
    }
    px := 0
    py := 0
    bonusMap := ""
    Click(config.staticValues.mapCoords[mapNumberOnPage][1], config.staticValues.mapCoords[mapNumberOnPage][2])
    search(400, 281, 0xFFFFFF)
    if(config.maps.%map%.gamemode == "easy") {
        Click(400, 281) ;easy
        sleep(config.speed)
        search(420,390, 0xFFFFFF) ;standard
        Click(420,390)
        sleep(config.speed)
        Click(721, 484) ;delete saved game
    } else if(config.maps.%map%.gamemode == "impoppable") {
        Click(900, 281) ;hard
        sleep(config.speed)
        search(870,491, 0xFFFFFF) ;impoppable
        Click(870,491)
        sleep(config.speed)
        Click(721, 484) ;delete saved game
        search(657,169, 0xFFFFFF) ;impoppable popup
        Click(657,169)
        sleep(config.speed*3)
    } else {
        MsgBox("Couldn't identify the gamemode on " . map . ": " . config.maps.%map%.gamemode)
        reload
    }
    search(1062, 17, 0xFFFFFF)
    return map
}

8:: {
    start: ; start screen
    map := selectMap("beginner", 3, 6, "cubism")
    sleep(config.speed)
    send("{" hotkeys.functional.play "}")
    sleep(config.speed)
    send("{" hotkeys.functional.play "}")
    for tower in config.maps.%map%.actions {
        if(tower.action == "place") {
            placeTower(tower.tower, tower.coords[1], tower.coords[2], tower.test, tower.testColor)
            selectTower(tower.coords[1], tower.coords[2])
            changeTargetting(tower.coords[1], tower.coords[2], tower.targetting)
            for upgrade in tower.upgrades {
                upgradetower(tower.coords[1], tower.coords[2], upgrade.path, upgrade.amount)
            }
            Send("{" hotkeys.functional.deselect "}")
            sleep(config.speed)
        } else if(tower.action == "sell") {
            selectTower(tower.coords[1], tower.coords[2])
            send("{" hotkeys.functional.sell "}")
        } else if(tower.action == "upgrade") {
            selectTower(tower.coords[1], tower.coords[2])
            for upgrade in tower.upgrades {
                upgradetower(tower.coords[1], tower.coords[2], upgrade.path, upgrade.amount)
            }
            Send("{" hotkeys.functional.deselect "}")
            sleep(config.speed)
        }
    }

    finish:
    if(config.maps.%map%.gamemode == "impoppable") {
        ; insta
        search(623, 441, 0xFFD900)
        sleep(config.speed)
        click
        sleep(config.speed)
    }
    ; next
    search(613, 600, 0xFFFFFF)
    sleep(config.speed)
    search(534, 459, 0x548AD3)
    sleep(config.speed)
    click(618, 603)
    ; home
    search(475, 559, 0xFFFFFF)
    sleep(config.speed)
    search(589, 205, 0xFFFFFF)
    sleep(config.speed)
    click(475, 559)

    goto("start")
  ;]
}

9:: {
    MsgBox("Insta Grinder Reloaded", "Reload", "0x0")
    reload
    return
}

0:: {
    MsgBox("Insta Grinder Stopped", "Exit", "0x0")
    ExitApp
}