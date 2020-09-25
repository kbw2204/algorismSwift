//
//  main.swift
//  크레인인형뽑기게임
//
//  Created by 강병우 on 2020/09/25.
//  Copyright © 2020 강병우. All rights reserved.
//

func solution(_ board:[[Int]], _ moves:[Int]) -> Int {
    var result = 0
    var stack: [Int] = []
    var map = board
    
    let checkHit: (Int) -> () = { value in
        if let last = stack.last {
            if value == last {
                stack.removeLast()
                result += 1
            } else {
                stack.append(value)
            }
        } else { stack.append(value) }
    }
    
    let getItem: (Int) -> Int = { value in
        for i in 0 ..< map.count {
            if map[i][value-1] != 0 {
                let item = map[i][value-1]
                map[i][value-1] = 0
                return item
            }
        }
        return 0
    }
    
    moves.forEach {
        let item = getItem($0)
        if item != 0 {
            checkHit(item)
        }
    }
    
    return result*2
}

let board = [[0,0,0,0,0],
             [0,0,1,0,3],
             [0,2,5,0,1],
             [4,2,4,4,2],
             [3,5,1,3,1]]
let moves = [1,5,3,5,1,2,1,4]

print(solution(board, moves))

/**
[[0,0,0,0,0],[0,0,1,0,3],[0,2,5,0,1],[4,2,4,4,2],[3,5,1,3,1]]
 [1,5,3,5,1,2,1,4]
*/
