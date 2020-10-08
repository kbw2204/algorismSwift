//
//  main.swift
//  N-Queen(프로그래머스)
//
//  Created by 강병우 on 2020/10/07.
//  Copyright © 2020 강병우. All rights reserved.
//

func solution(_ n:Int) -> Int {
    let banList: [Bool] = Array(repeating: false, count: n)
    let leftCheck = Array(repeating: true, count: n)
    let rifhtCheck = Array(repeating: true, count: n)
    let line = Array(repeating: true, count: n)
    var count = 0
    
    dfs(line, 0, leftCheck, rifhtCheck, banList, -3, n, &count)
    
    return count
}

func dfs(_ line: [Bool], _ depth: Int, _ lc: [Bool], _ rc: [Bool], _ banList: [Bool], _ bf: Int, _ n: Int, _ count: inout Int) {
    if depth == n {
        count += 1
        return
    }
    
    for i in 0 ..< n {
        if i == bf-1 || banList[i] || i == bf+1 { continue } // 이전에 넣은 값으로 비교
        else if lc[i] && rc[i] { // 대각선
            var line = line
            line[i] = false
            var lc = lc
            var rc = rc
            // 세로 제외요소 추가
            var banList = banList
            banList[i] = true
            
            // 오른쪽 왼쪽 둘다 좌우로 퍼져야 하니깐 둘다 값 넣어서
            lc[i] = false
            rc[i] = false
            
            // 왼쪽 shift
            lc.removeFirst()
            lc.append(true)
            // 오른쪽 shift
            rc.removeLast()
            rc.insert(true, at: 0)
            dfs(line, depth+1, lc, rc, banList, i, n, &count)
        }
    }
}

for i in 1 ..< 12 {
    print(solution(i))
}
