//
//  main.swift
//  연구소
//
//  Created by 강병우 on 2020/05/22.
//  Copyright © 2020 강병우. All rights reserved.
/*
크기 n × m
바이러스
 - 상하좌우로 퍼질 수있음
 벽 3개를 세울 수 있음(꼭 세워야 함)
 0 - 빈칸
 1 - 벽
 2 - 바이러스
 
 벽 3개를 세운 뒤 퍼질 수 없는곳 = 안전 영역
 ∴ 안전 영역 최댓값 구하기
 
 입력 ~ n, m값
*/

import Foundation

// MARK: - func
func makeRoom(list: [[Int]], count: Int, nm: [Int], virusPosList: Set<[Int]>, max: inout Int) {
    if count == 3 {
        // 바이러스 퍼지기
        virusDfs(virusPosList: virusPosList, list: list, nm: nm, key: true, safeZoneCount: &max)
        return
    }
    for i in 0 ..< nm[1] {
        for j in 0 ..< nm[0] {
            if list[i][j] == 0 {
                var vList = list
                vList[i][j] = 1
                makeRoom(list: vList, count: count + 1, nm: nm, virusPosList: virusPosList, max: &max)
            }
        }
    }
}

// 여기 과정 다시 고쳐야함 어떻게할지 생각
func virusDfs(virusPosList: Set<[Int]>, list: [[Int]], nm: [Int], key: Bool, safeZoneCount: inout Int) {
    if !key {
        var tmp = 0
        for pos in virusPosList {
            tmp += pos.filter{$0 == 0}.count
        }
        if tmp > safeZoneCount {
            safeZoneCount = tmp
        }
        return
    }
    var vVirusPosList = virusPosList
    for pos in virusPosList {
        let x = pos[0]
        let y = pos[1]
        // 좌
        if y != 0 && list[x][y-1] != 1 {
            vVirusPosList.insert([x,y-1])
        }
        // 우
        else if y != nm[1]-1 && list[x][y+1] != 1 {
            vVirusPosList.insert([x,y+1])
        }
        // 위
        else if x != 0  && list[x-1][y] != 1 {
            vVirusPosList.insert([x-1,y])
        }
        // 아래
        else if x != 0  && list[x+1][y] != 1 {
            vVirusPosList.insert([x+1,y])
        }
    }
}


// MARK: - start
//let nm: [Int] = readLine()!.components(separatedBy: " ").map{Int($0)!}
//var list: [[Int]] = []
//// 0 - n 1 - m
//for _ in 0 ..< nm[1] {
//    let line: [Int] = readLine()!.components(separatedBy: " ").map{Int($0)!}
//    list.append(line)
//}



let nm = [7, 7]
var max = 0
var list = [
    [2, 0, 0, 0, 1, 1, 0],
    [0, 0, 1, 0, 1, 2, 0],
    [0, 1, 1, 0, 1, 0, 0],
    [0, 1, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 1, 1],
    [0, 1, 0, 0, 0, 0, 0],
    [0, 1, 0, 0, 0, 0, 0],
]
var virusPosList: Set<[Int]> = []
for i in 0 ..< nm[1] {
    for j in 0 ..< nm[0] {
        if list[i][j] == 2 {
            virusPosList.insert([i,j])
        }
    }
}

makeRoom(list: list, count: 0, nm: nm, virusPosList: virusPosList, max: &max)
print(max)


