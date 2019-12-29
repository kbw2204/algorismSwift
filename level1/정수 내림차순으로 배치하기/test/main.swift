//
//  main.swift
//  test
//
//  Created by 강병우 on 30/12/2019.
//  Copyright © 2019 강병우. All rights reserved.
//

import Foundation

func solution(_ n:Int64) -> Int64 {
    return Int64("\(n)".compactMap{$0.hexDigitValue}.sorted(by: >).map{String($0)}.joined()) ?? 0
}

print(solution(1183))
