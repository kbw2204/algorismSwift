//
//  main.swift
//  프렌즈4블록
//
//  Created by 강병우 on 2020/10/24.
//

//import Foundation

func solution(_ m:Int, _ n:Int, _ board:[String]) -> Int {
    
    let b = board.map{$0.map{String($0)}}
    var result = 0
    var newBoard: [[String]] = Array(repeating: Array(repeating: "", count: m), count: n)
    var pangList: [[Int]] = Array(repeating: [], count: n)
    for w in 0 ..< n {
        for h in (0..<m).reversed() {
            newBoard[w][m-h-1] = b[h][w]
        }
    }

    // m = h, n = w
    let checkBox: (Int, Int) -> Bool = { w, h in
        if newBoard[w+1].count-1 < h+1 { return false }
        if newBoard[w][h] == newBoard[w][h+1] && newBoard[w+1][h] == newBoard[w][h] && newBoard[w+1][h] == newBoard[w+1][h+1] {
            return true
        }
        return false
    }
    
    while true {
        var pang = false
        for w in 0 ..< newBoard.count-1 {
            if newBoard[w].count > 1 {
                for h in (0 ..< newBoard[w].count-1).reversed() {
                    if checkBox(w,h) {
                        if !pangList[w].contains(h) { pangList[w].append(h) }
                        if !pangList[w+1].contains(h) { pangList[w+1].append(h) }
                        pangList[w].sort(by: >)
                        pangList[w+1].sort(by: >)
                        if !pang { pang = true }
                    }
                }
            }
        }

        if !pang { break }
        else {
            for w in 0 ..< newBoard.count {
                for i in 0 ..< pangList[w].count {
                    if i != pangList[w].count-1 {
                        if pangList[w][i+1]+1 == pangList[w][i] {
                            newBoard[w].remove(at: pangList[w][i])
                            result += 1
                        } else {
                            newBoard[w].remove(at: pangList[w][i])
                            newBoard[w].remove(at: pangList[w][i])
                            result += 2
                        }
                    } else {
                        newBoard[w].remove(at: pangList[w][i])
                        newBoard[w].remove(at: pangList[w][i])
                        result += 2
                    }
                }
                pangList[w].removeAll()
            }
        }
    }
    
    return result
}


let b = ["IIIIOO", "IIIOOO", "IIIOOI", "IOOIII", "OOOIII", "OOIIII"]

let rs = solution(6, 6, b) // 14
print(rs)
