//
//  main.swift
//  짝지어 제거하기
//
//  Created by 강병우 on 2020/10/21.
//

import Foundation

func solution(_ s:String) -> Int{
    var stack: [Character] = []
    s.forEach {
        if !stack.isEmpty {
            if let peek = stack.last, peek == $0 {
                stack.removeLast()
            } else { stack.append($0)}
        } else { stack.append($0)}
    }
    
    return stack.isEmpty ? 1 : 0
}

let s = "cdcd"
let rs = solution(s)
print(rs)
