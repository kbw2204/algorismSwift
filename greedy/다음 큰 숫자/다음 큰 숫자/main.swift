//
//  main.swift
//  다음 큰 숫자
//
//  Created by 강병우 on 2020/09/28.
//

import Foundation

func solution(_ n:Int) -> Int
{
    var answer:Int = n+1
    let count: (Int) -> Int = { n in
        let b = String(n, radix: 2)
        return b.map{$0 as Character}.filter{$0 == ("1" as Character)}.count
    }
    
    let target = count(n)
    
    while target != count(answer) {
        answer += 1
    }
    
    return answer
}

print(solution(78))

//func solution(_ n:Int) -> Int {
//    var answer : Int = n + 1
//
//    while true {
//        if n.nonzeroBitCount == answer.nonzeroBitCount {
//            break;
//        }
//        answer += 1
//    }
//
//    return answer
//}
