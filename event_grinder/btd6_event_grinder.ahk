#Requires AutoHotkey v2.0

; Original (21.0) by infinity
; recoded and updated by Chantity

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
;     }, {
;     action: "sell",
;     coords: [326, 218]
;     }

;sell tower:
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
        bonusCoords: [
            [435, 197],
            [718, 198],
            [1000, 197],
            [432, 401],
            [716, 409],
            [1000, 408]
        ],
        maps: [ ;per page
            ["dark_dungeons", "sanctuary", "ravine", "flooded_valley", "infernal", "bloody_puddles"],
            ["workshop", "quad", "dark_castle", "muddy_puddles", "ouch"]
        ]
    },
    towers: {
        ben: {
            buyTestCoords: {
                x: 1143,
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
                x: 1227,
                y: 622
            }
        },
        alch: { ;heli price coords
            buyTestCoords: {
                x: 1227,
                y: 622
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
                x: 1227,
                y: 622
            }
        },
        village: { ;heli price coords
            buyTestCoords: { ;only use village in your strategy if you already placed a military tower
                x: 1227,
                y: 622
            }
        },
        spactory: { ;heli price coords
            buyTestCoords: { ;can be used with military discount
                x: 1227,
                y: 622
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
        dark_dungeons: {
            gamemode: "easy",
            actions: [{
                action: "place",
                tower: "dart",
                coords: [897, 692],
                test: false,
                testColor: "0xFFFFFF", ;has to exist even if test is false, has to be a number
                targetting: 0,
                upgrades: []
                }, {
                action: "place",
                tower: "ben",
                coords: [559, 220],
                test: false,
                testColor: "0xFFFFFF",
                targetting: 0,
                upgrades: []
                }, {
                action: "place",
                tower: "sniper",
                coords: [198, 105],
                test: false,
                testColor: "0xFFFFFF",
                targetting: 1,
                upgrades: []
                }, {
                action: "place",
                tower: "druid",
                coords: [529, 608],
                test: false,
                testColor: "0xFFFFFF",
                targetting: 0,
                upgrades: [
                    {path: 2, amount: 3}
                    ]
                }, {
                action: "place",
                tower: "village",
                coords: [499, 658],
                test: false,
                testColor: "0xFFFFFF",
                targetting: 0,
                upgrades: [
                    {path: 2,amount: 2},
                    {path: 3, amount: 2}
                    ]
                }, {
                action: "place",
                tower: "druid",
                coords: [478, 604],
                test: false,
                testColor: "0xFFFFFF",
                targetting: 3,
                upgrades: [
                    {path: 2, amount: 3},
                    {path: 1, amount: 1}
                    ]
                }, {
                action: "place",
                tower: "druid",
                coords: [399, 594],
                test: false,
                testColor: "0xFFFFFF",
                targetting: 3,
                upgrades: [
                    {path: 2, amount: 3},
                    {path: 1, amount: 1}
                    ]
                }, {
                action: "place",
                tower: "druid",
                coords: [378, 634],
                test: false,
                testColor: "0xFFFFFF",
                targetting: 0,
                upgrades: [
                    {path: 2, amount: 3}
                    ]
                }, {
                action: "place",
                tower: "druid",
                coords: [399, 674],
                test: false,
                testColor: "0xFFFFFF",
                targetting: 0,
                upgrades: [
                    {path: 2, amount: 3}
                    ]
                }, {
                action: "place",
                tower: "druid",
                coords: [603, 631],
                test: false,
                testColor: "0xFFFFFF",
                targetting: 0,
                upgrades: [
                    {path: 2, amount: 3}
                    ]
                }, {
                action: "place",
                tower: "bomb",
                coords: [602, 675],
                test: false,
                testColor: "0xFFFFFF",
                targetting: 3,
                upgrades: [
                    {path: 2, amount: 3},
                    {path: 1, amount: 2}
                    ]
            }]},
        sanctuary: {
            gamemode: "easy",
            actions: [{
                action: "place",
                tower: "dart",
                coords: [655, 185],
                test: true,
                testColor: "0x7AE5CE",
                targetting: 0,
                upgrades: []
                }, {
                action: "place",
                tower: "ben",
                coords: [130, 236],
                test: false,
                testColor: "0xFFFFFF",
                targetting: 0,
                upgrades: []
                }, {
                action: "place",
                tower: "sniper",
                coords: [654, 654],
                test: true,
                testColor: "0x7B7427",
                targetting: 3,
                upgrades: [
                    {path: 1, amount: 1},
                    {path: 3, amount: 2}
                    ]
                }, {
                action: "place",
                tower: "sniper",
                coords: [564, 651],
                test: false,
                testColor: "0xFFFFFF",
                targetting: 0,
                upgrades: [
                    {path: 2, amount: 2},
                    {path: 3, amount: 5}
                    ]
            }]},
        ravine: {
            gamemode: "easy",
            actions: [{
                action: "place",
                tower: "dart",
                coords: [188, 442],
                test: false,
                testColor: "0x83E5CB",
                targetting: 0,
                upgrades: []
                }, {
                action: "place",
                tower: "ben",
                coords: [462, 128],
                test: false,
                testColor: "0xFFFFFF",
                targetting: 0,
                upgrades: []
                }, {
                action: "place",
                tower: "druid",
                coords: [492, 544],
                test: false,
                testColor: "0x7B7427",
                targetting: 3,
                upgrades: [
                    {path: 2, amount: 3},
                    {path: 1, amount: 1}
                    ]
                }, {
                action: "place",
                tower: "sniper",
                coords: [438, 559],
                test: false,
                testColor: "0xFFFFFF",
                targetting: 0,
                upgrades: [
                    {path: 2, amount: 2},
                    {path: 3, amount: 5}
                    ]
            }]},
        flooded_valley: {
            gamemode: "easy",
            actions: [{
                action: "place",
                tower: "ben",
                coords: [164, 510],
                test: false,
                testColor: "0xFFFFFF",
                targetting: 0,
                upgrades: []
                }, {
                action: "place",
                tower: "sub",
                coords: [682, 500],
                test: false,
                testColor: "0x7B7427",
                targetting: 3,
                upgrades: [
                    {path: 3, amount: 1},
                    {path: 2, amount: 2}
                    ]
                }, {
                action: "place",
                tower: "sniper",
                coords: [388, 528],
                test: false,
                testColor: "0xFFFFFF",
                targetting: 0,
                upgrades: [
                    {path: 2,amount: 2},
                    {path: 3, amount: 5}
                    ]
            }]},
        infernal: {
            gamemode: "easy",
            actions: [{
                action: "place",
                tower: "dart",
                coords: [558, 461],
                test: false,
                testColor: "0xFFFFFF",
                targetting: 0,
                upgrades: []
                }, {
                action: "place",
                tower: "ben",
                coords: [68, 381],
                test: false,
                testColor: "0xFFFFFF",
                targetting: 0,
                upgrades: []
                }, {
                action: "place",
                tower: "sub",
                coords: [795, 179],
                test: false,
                testColor: "0x7B7427",
                targetting: 0,
                upgrades: [
                    {path: 1, amount: 2},
                    {path: 3, amount: 3}
                    ]
                }, {
                action: "place",
                tower: "druid",
                coords: [556, 255],
                test: false,
                testColor: "0xFFFFFF",
                targetting: 0,
                upgrades: [
                    {path: 2, amount: 3},
                    {path: 1, amount: 1}
                    ]
                }, {
                action: "place",
                tower: "boat",
                coords: [318, 526],
                test: false,
                testColor: "0x7B7427",
                targetting: 0,
                upgrades: [
                    {path: 3, amount: 2},
                    {path: 2, amount: 3}
                    ]
                }, {
                action: "place",
                tower: "sniper",
                coords: [1024, 365],
                test: false,
                testColor: "0x7B7427",
                targetting: 1,
                upgrades: [{path: 1, amount: 2},
                    {path: 3, amount: 4}
                    ]
                }, {
                action: "place",
                tower: "sniper",
                coords: [77, 439],
                test: false,
                testColor: "0x7B7427",
                targetting: 1,
                upgrades: [
                    {path: 1, amount: 2},
                    {path: 3, amount: 3}
                    ]
            }]},
        bloody_puddles: {
            gamemode: "easy",
            actions: [{
                action: "place",
                tower: "dart",
                coords: [271, 206],
                test: false,
                testColor: "0xFFFFFF",
                targetting: 0,
                upgrades: []
                }, {
                action: "place",
                tower: "ben",
                coords: [413, 123],
                test: false,
                testColor: "0xFFFFFF",
                targetting: 0,
                upgrades: []
                }, {
                action: "place",
                tower: "druid",
                coords: [872, 664],
                test: false,
                testColor: "0x7B7427",
                targetting: 3,
                upgrades: [
                    {path: 2, amount: 3},
                    {path: 1, amount: 1}
                    ]
                }, {
                action: "place",
                tower: "sniper",
                coords: [637, 321],
                test: false,
                testColor: "0xFFFFFF",
                targetting: 0,
                upgrades: [
                    {path: 2,amount: 2},
                    {path: 3, amount: 5}
                    ]
            }]},
        workshop: {
            gamemode: "easy",
            actions: [{
                action: "place",
                tower: "dart",
                coords: [95, 415],
                test: false,
                testColor: "0xFFFFFF",
                targetting: 0,
                upgrades: []
                }, {
                action: "place",
                tower: "ben",
                coords: [408, 92],
                test: false,
                testColor: "0xFFFFFF",
                targetting: 0,
                upgrades: []
                }, {
                action: "place",
                tower: "sniper",
                coords: [455, 334],
                test: false,
                testColor: "0x7B7427",
                targetting: 3,
                upgrades: []
                }, {
                action: "place",
                tower: "druid",
                coords: [794, 280],
                test: false,
                testColor: "0x7B7427",
                targetting: 0,
                upgrades: [
                    {path: 2, amount: 3}
                    ]
                }, {
                action: "place",
                tower: "village",
                coords: [842, 173],
                test: false,
                testColor: "0xFFFFFF",
                targetting: 0,
                upgrades: [
                    {path: 2, amount: 2},
                    {path: 3, amount: 2}
                    ]
                }, {
                action: "place",
                tower: "druid",
                coords: [794, 236],
                test: false,
                testColor: "0x7B7427",
                targetting: 3,
                upgrades: [
                    {path: 2, amount: 3},
                    {path: 1, amount: 1}
                    ]
                }, {
                action: "place",
                tower: "druid",
                coords: [845, 280],
                test: false,
                testColor: "0x7B7427",
                targetting: 3,
                upgrades: [
                    {path: 2, amount: 3},
                    {path: 1, amount: 1}
                    ]
                }, {
                action: "place",
                tower: "druid",
                coords: [844, 230],
                test: false,
                testColor: "0x7B7427",
                targetting: 0,
                upgrades: [
                    {path: 2, amount: 3}
                    ]
                }, {
                action: "place",
                tower: "druid",
                coords: [794, 135],
                test: false,
                testColor: "0x7B7427",
                targetting: 0,
                upgrades: [
                    {path: 2, amount: 3}
                    ]
                }, {
                action: "place",
                tower: "druid",
                coords: [794, 91],
                test: false,
                testColor: "0x7B7427",
                targetting: 0,
                upgrades: [
                    {path: 2, amount: 3}
                    ]
                }, {
                action: "place",
                tower: "bomb",
                coords: [840, 116],
                test: false,
                testColor: "0x7B7427",
                targetting: 3,
                upgrades: [
                    {path: 2, amount: 3},
                    {path: 1, amount: 2}
                    ]
                }, {
                action: "place",
                tower: "bomb",
                coords: [840, 72],
                test: false,
                testColor: "0x7B7427",
                targetting: 3,
                upgrades: [
                    {path: 2, amount: 3},
                    {path: 1, amount: 2}
                    ]
            }]},
        quad: {
            gamemode: "easy",
            actions: [{
                action: "place",
                tower: "dart",
                coords: [273, 370],
                test: false,
                testColor: "0xFFFFFF",
                targetting: 0,
                upgrades: []
                }, {
                action: "place",
                tower: "ben",
                coords: [394, 361],
                test: false,
                testColor: "0xFFFFFF",
                targetting: 0,
                upgrades: []
                }, {
                action: "place",
                tower: "sniper",
                coords: [787, 517],
                test: false,
                testColor: "0x7B7427",
                targetting: 3,
                upgrades: [{
                    path: 1,
                    amount: 1
                    }, {
                    path: 3,
                    amount: 2
                    }]
                }, {
                action: "place",
                tower: "sniper",
                coords: [554, 181],
                test: false,
                testColor: "0xFFFFFF",
                targetting: 0,
                upgrades: [{
                    path: 2,
                    amount: 2
                    }, {
                    path: 3,
                    amount: 5
                    }]
            }]},
        dark_castle: {
            gamemode: "easy",
            actions: [{
                action: "place",
                tower: "dart",
                coords: [358, 309],
                test: false,
                testColor: "0xFFFFFF",
                targetting: 0,
                upgrades: []
                }, {
                action: "place",
                tower: "ben",
                coords: [565, 268],
                test: false,
                testColor: "0xFFFFFF",
                targetting: 0,
                upgrades: []
                }, {
                action: "place",
                tower: "sniper",
                coords: [863, 123],
                test: false,
                testColor: "0x7B7427",
                targetting: 3,
                upgrades: [{
                    path: 1,
                    amount: 1
                    }, {
                    path: 3,
                    amount: 2
                    }]
                }, {
                action: "place",
                tower: "sniper",
                coords: [971, 295],
                test: false,
                testColor: "0xFFFFFF",
                targetting: 0,
                upgrades: [{
                    path: 2,
                    amount: 2
                    }, {
                    path: 3,
                    amount: 5
                    }]
            }]},
        muddy_puddles: {
            gamemode: "easy",
            actions: [{
                action: "place",
                tower: "dart",
                coords: [326, 218],
                test: false,
                testColor: "0xFFFFFF",
                targetting: 0,
                upgrades: []
                }, {
                action: "place",
                tower: "ben",
                coords: [405, 298],
                test: false,
                testColor: "0xFFFFFF",
                targetting: 0,
                upgrades: []
                }, {
                action: "place",
                tower: "sniper",
                coords: [714, 20],
                test: false,
                testColor: "0x7B7427",
                targetting: 3,
                upgrades: [{
                    path: 1,
                    amount: 1
                    }, {
                    path: 3,
                    amount: 2
                    }]
                }, {
                action: "place",
                tower: "sniper",
                coords: [584, 614],
                test: false,
                testColor: "0xFFFFFF",
                targetting: 0,
                upgrades: [{
                    path: 2,
                    amount: 2
                    }, {
                    path: 3,
                    amount: 5
                    }]
            }]},
        ouch: {
            gamemode: "easy",
            actions: [{
                action: "place",
                tower: "dart",
                coords: [352, 198],
                test: false,
                testColor: "0xFFFFFF",
                targetting: 0,
                upgrades: []
                }, {
                action: "place",
                tower: "ben",
                coords: [287, 138],
                test: false,
                testColor: "0xFFFFFF",
                targetting: 0,
                upgrades: []
                }, {
                action: "place",
                tower: "sniper",
                coords: [444, 215],
                test: false,
                testColor: "0x7B7427",
                targetting: 3,
                upgrades: [{
                    path: 1,
                    amount: 1
                    }, {
                    path: 3,
                    amount: 2
                    }]
                }, {
                action: "place",
                tower: "sniper",
                coords: [762, 510],
                test: false,
                testColor: "0xFFFFFF",
                targetting: 0,
                upgrades: [{
                    path: 2,
                    amount: 2
                    }, {
                    path: 3,
                    amount: 5
                    }]
            }]}
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

checkBonus(x, y) {
    return 
}

selectMapWithBonus() {
    ;expects you to start at the first page of the expert maps in the map selection screen
    px := 0
    py := 0
    bonusMap := ""
    for page in config.staticValues.maps {
        for i, map in page {
            sleep(config.speed)
            ; MouseMove(config.staticValues.bonusCoords[i][1], config.staticValues.bonusCoords[i][2])
            ; MsgBox(PixelGetColor(config.staticValues.bonusCoords[i][1], config.staticValues.bonusCoords[i][2]))
            if(PixelSearch(&px, &py, config.staticValues.bonusCoords[i][1], config.staticValues.bonusCoords[i][2], config.staticValues.bonusCoords[i][1], config.staticValues.bonusCoords[i][2], 0xFFFFFF)) {
                Click(config.staticValues.bonusCoords[i][1], config.staticValues.bonusCoords[i][2])
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
                Click(721, 484)
                search(1062, 17, 0xFFFFFF)
                return map
            }
        }
        Click(config.staticValues.nextPageButton[1], config.staticValues.nextPageButton[2])
        sleep(400)
    }
    MsgBox("Couldn't find the bonus")
    reload
}

8:: {
    start: ; start screen
    search(550, 620, 0xFFFFFF)
    sleep(config.speed)
    click(550, 620)
    sleep(800)
    click(391, 650)
    sleep(200)
    click(900, 650)
    sleep(1000)

    map := selectMapWithBonus()
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
    MsgBox("Event Grinder Reloaded", "Reload", "0x0")
    reload
    return
}

0:: {
    MsgBox("Event Grinder Stopped", "Exit", "0x0")
    ExitApp
}