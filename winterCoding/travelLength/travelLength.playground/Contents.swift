//
//  main.swift
//  test
//
//  Created by 강병우 on 20/11/2019.
//  Copyright © 2019 강병우. All rights reserved.
//

func solution(_ dirs:String) -> Int {
    var posX = 0
    var posY = 0
    var log: [Set<String>] = []
    
    for c in dirs {
        switch c {
        case "U":
            if posY < 5 {
                posY += 1
                if check(log: log, input: [String(posX)+","+String(posY-1), String(posX)+","+String(posY)]) {
                    log.append([String(posX)+","+String(posY-1), String(posX)+","+String(posY)])
                }
            }
        case "D":
            if posY > -5 {
                posY -= 1
                if check(log: log, input: [String(posX)+","+String(posY+1), String(posX)+","+String(posY)]) {
                    log.append([String(posX)+","+String(posY+1), String(posX)+","+String(posY)])
                }
            }
        case "L":
            if posX > -5 {
                posX -= 1
                if check(log: log, input: [String(posX+1)+","+String(posY), String(posX)+","+String(posY)]) {
                    log.append([String(posX+1)+","+String(posY), String(posX)+","+String(posY)])
                }
            }
        case "R":
            if posX < 5 {
                posX += 1
                if check(log: log, input: [String(posX-1)+","+String(posY), String(posX)+","+String(posY)]) {
                    log.append([String(posX-1)+","+String(posY), String(posX)+","+String(posY)])
                }
            }
        default:
            print("err")
            return 0
        }
    }
    return log.count
}

func check(log: [Set<String>], input: Set<String>) -> Bool {
    return log.filter{$0 == input}.isEmpty ? true : false
}

let testInput = ["ULURRDLLU","LULLLLLLU", "LLLLRLRLRLL", "UUUUDUDUDUUU", "LURDLURDLURDLURDRULD", "RRRRRRRRRRRRRRRRRRRRRUUUUUUUUUUUUULU"]
let testOutput = [7,7, 5, 5, 7, 11]

for i in 4 ..< testInput.count {
    let output = solution(testInput[i])
    if output == testOutput[i] {
        print("성공")
    } else {
        print("실패: \(testInput[i]) : \(output)")
    }
}
