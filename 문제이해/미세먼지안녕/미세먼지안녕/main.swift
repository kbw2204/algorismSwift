//
//  main.swift
//  미세먼지안녕
//
//  Created by 강병우 on 2020/06/11.
//  Copyright © 2020 강병우. All rights reserved.
//
/*
 -1 이 공기청정기 위치
 shift 메소드가 있어야 할 것 같고
 
*/

import Foundation

let input: [Int] = readLine()!.split(separator: " ").map{Int(String($0))!} // R C(크기) T(초)
let r = input.first!
let c = input[1]
let time = input.last!
var sum = 0
var blocks: [[Int]] = []

for _ in 0 ..< r {
    blocks.append(readLine()!.split(separator: " ").map{Int(String($0))!})
}

func bottomCycle(bottomBlocks: [[Int]], r: Int, c: Int) -> [[Int]] {
    var result: [[Int]] = bottomBlocks
    var rightArray: [Int] = result.map{$0.last!}
    var leftArray: [Int] = result.map{$0.first!}
    result[0].insert(0, at: 1)
    result[0].removeLast()
    if r > 2 {
        leftArray.removeFirst()
        leftArray.removeFirst()
        rightArray.removeLast()
        result[r-1].removeFirst()
        result[r-1].append(rightArray.removeLast())
        let rCount = rightArray.count
        for i in 0 ..< rCount {
            result[i+1][c-1] = rightArray.removeFirst()
            result[i+1][0] = leftArray.removeFirst()
        }
    } else {
        result[1].append(rightArray.first!)
    }
    return result
}

func topCycle(topBlocks: [[Int]], r: Int, c: Int) -> [[Int]] {
    var result: [[Int]] = topBlocks
    var rightArray: [Int] = result.map{$0.last!}
    var leftArray: [Int] = result.map{$0.first!}
    result[0].removeFirst()
    
    if r > 2 {
        rightArray.removeFirst()
        leftArray.removeLast()
        leftArray.removeLast()
        
        result[0].append(rightArray.removeFirst())
        result[r-1].removeLast()
        result[r-1].insert(0, at: 1)
        let rCount = rightArray.count
        for i in 0 ..< rCount {
            result[i+1][c-1] = rightArray.removeFirst()
            result[i+1][0] = leftArray.removeFirst()
        }
    } else {
        result[0].append(rightArray.first!)
        result[1].insert(0, at: 1)
        result[1].removeLast()
    }
    return result
}

func diffusion(blocks: inout [[Int]], r: Int, c: Int, fresh: Int) {
    var result: [[Int]] = Array(repeating: Array(repeating: 0, count: c), count: r)
    
    for i in 0 ..< r {
        for j in 0 ..< c {
            // 하나의 블럭
            let dust = blocks[i][j]
            if dust != 0 && dust != -1{
                var count = 0
                
                let diffusionDust = dust/5
                
                //좌
                if j != 0 && blocks[i][j-1] != -1 {
                    count += 1
                    result[i][j-1] += diffusionDust
                }
                // 우
                if j != c-1 {
                    count += 1
                    result[i][j+1] += diffusionDust
                }
                // 아래
                if i != r-1 && blocks[i+1][j] != -1 {
                    count += 1
                    result[i+1][j] += diffusionDust
                }
                // 위
                if i != 0 && blocks[i-1][j] != -1 {
                    count += 1
                    result[i-1][j] += diffusionDust
                }
                result[i][j] -= diffusionDust*count
            }
        }
    }
    // 확산된것 더해줌
    for i in 0 ..< r {
        for j in 0 ..< c {
            blocks[i][j] += result[i][j]
        }
    }
}

// 공기청정기 위치 찾기
var fresh = 0
for i in 0 ..< r {
    if blocks[i].first! == -1 {
        fresh = i
        break
    }
}

for _ in 0 ..< time {
    diffusion(blocks: &blocks, r: r, c: c, fresh: fresh)
    let top = blocks[...fresh].map{$0}
    let bottom = blocks[fresh+1..<r].map{$0}
    blocks = topCycle(topBlocks: top, r: fresh+1, c: c) + bottomCycle(bottomBlocks: bottom, r: r-1-fresh, c: c)
}
for line in blocks {
    sum += line.reduce(0, {$0+$1})
}
print(sum + 2)
