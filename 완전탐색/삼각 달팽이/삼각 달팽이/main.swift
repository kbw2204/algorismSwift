//
//  main.swift
//  삼각 달팽이
//
//  Created by 강병우 on 2020/09/28.
//

func solution(_ n:Int) -> [Int] {
    var 삼각형: [[Int]] = [[]]
    var height = 1
    var widthIdx = 0
    var level = 0
    var isUp = true
    let cal: (Int) -> Int = {
        var sum = 0
        for i in 1 ... $0 {
            sum += i
        }
        return sum
    }
    let sum = cal(n)
    var count = 1
    
    for i in 1 ... n {
        let arr = Array(repeating: 0, count: i)
        삼각형.append(arr)
    }
    
    while count != sum+1 {
        if (height > level) && (height < n-level) {
            if isUp {
                삼각형[height][widthIdx] = count
                height += 1
            } else {
                삼각형[height][widthIdx] = count
                height -= 1
                widthIdx -= 1
                if height == level*2 + 1 {
                    level += 1
                    height += 2
                    widthIdx += 1
                    isUp = true
                }
            }
            count += 1
        } else if height == n-level {
            for idx in level ..< 삼각형[height].count-level {
                삼각형[height][idx] = count
                count += 1
            }
            height -= 1
            widthIdx = n-(level*2)-2
            isUp = false
        } else if height == level {
            isUp = true
            삼각형[height][level] = count
            count += 1
        }
        
    }
    
    return 삼각형.flatMap{$0}
}

let rs = solution(7)
