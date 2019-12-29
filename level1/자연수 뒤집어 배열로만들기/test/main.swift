//
//  main.swift
//  test
//
//  Created by 강병우 on 01/12/2019.
//  Copyright © 2019 강병우. All rights reserved.
//

import Foundation

func solution(_ n:Int64) -> [Int] {
    return String(n).map{String($0)}.reversed().map{Int($0)!}
//    return  "\(n)".compactMap { $0.hexDigitValue }.reversed()
}

