//
//  main.swift
//  star
//
//  Created by 강병우 on 02/01/2020.
//  Copyright © 2020 강병우. All rights reserved.
//
import Foundation

let n = readLine()!.components(separatedBy: [" "]).map { Int($0)! }
let (a, b) = (n[0], n[1])

for _ in 0 ..< b {
    print(String(repeating: "*", count: a))
}
