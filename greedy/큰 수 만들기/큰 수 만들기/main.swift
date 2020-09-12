//
//  main.swift
//  큰 수 만들기
//
//  Created by 강병우 on 2020/09/12.
//  Copyright © 2020 강병우. All rights reserved.
//1924 2 94

import Foundation

func solution(_ number: String, _ k: Int) -> String {
    var numbers = number.compactMap { $0.wholeNumberValue }

    let count = numbers.count
    for _ in 0..<k {
        for i in numbers.indices {
            if numbers[i] == 0 {
                numbers.remove(at: i)
                break
            }
            if i+1 < count {
                if numbers[i] < numbers[i+1]  {
                    numbers.remove(at: i)
                    break
                }
            }
        }
    }
    
    return numbers.reduce("", {$0+String($1)})
}
