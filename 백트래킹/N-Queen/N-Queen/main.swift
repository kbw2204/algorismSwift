//
//  main.swift
//  N-Queen
//
//  Created by 강병우 on 2020/10/03.
//  Copyright © 2020 강병우. All rights reserved.
//

//let n = Int(readLine()!)!
//
//var mp: [[Bool]] = Array(repeating: Array(repeating: true, count: n), count: n)
//var result = 0
//dfs(mp, 0, -3, &result)
//print(result)
//
//func setDisable(_ tmp: [[Bool]] ,_ x: Int, _ y: Int) -> [[Bool]] {
//    var size = 0
//    var mp = tmp
//
//    // 가운데
//    for i in y ..< n {
//        if mp[i][x] {
//            mp[i][x] = false
//        }
//    }
//
//    while !(y-size <= 0 && y+size >= n) {
//        // 좌
//        if x-size >= 0 {
//            // 아래
//            if y+size < n {
//                if mp[y+size][x-size] {
//                    mp[y+size][x-size] = false
//                }
//            }
//        }
//
//        // 우
//        if x+size < n {
//            // 아래
//            if y+size < n {
//                if mp[y+size][x+size] {
//                    mp[y+size][x+size] = false
//                }
//            }
//        }
//
//        size += 1
//    }
//    return mp
//}
//
//
//func dfs(_ mp: [[Bool]], _ depth: Int, _ beforeIdx: Int, _ result: inout Int) {
//    if depth == n {
//        result += 1
//        return
//    }
//    // i가 x, depth가 y값
//    for i in 0 ..< n {
//        if i == beforeIdx - 1 || i == beforeIdx || i == beforeIdx + 1 {
//            continue
//        } else {
//            if mp[depth][i] {
//                let newMp = setDisable(mp, i, depth)
//                dfs(newMp, depth+1, i, &result)
//            }
//        }
//    }
//}


let n = Int(readLine()!)!

var lt: [Bool] = Array(repeating: true, count: n)
var rt: [Bool] = Array(repeating: true, count: n)
var benList: [Bool] = Array(repeating: false, count: n)
var result = 0
dfs(lt,rt,benList,-3, 0, &result)

print(result)

func dfs(_ tlt: [Bool],_ trt: [Bool], _ benList: [Bool], _ bfIdx: Int, _ depth: Int, _ result: inout Int) {
    if depth == n {
        result += 1
        return
    }

    for i in 0 ..< n {
        if benList[i] || i == bfIdx - 1 || i == bfIdx + 1 {
            continue
        } else {
            if tlt[i] && trt[i] {
                var lt = tlt
                var rt = trt
                var vBenList = benList
                vBenList[i] = true

                lt[i] = false
                rt[i] = false

                lt.removeFirst()
                lt.append(true)
                rt.removeLast()
                rt.insert(true, at: 0)

                dfs(lt, rt, vBenList, i, depth+1, &result)
            }
        }
    }
}
