//
//  main.swift
//  하얀칸
//
//  Created by 강병우 on 2020/08/12.
//  Copyright © 2020 강병우. All rights reserved.
//

//import Foundation
var result = 0

for count in 0 ..< 8 {
    let line = readLine()!.map{String($0)}
    if count % 2 == 0 {
        for i in stride(from: 0, through: 7, by: 2) {
            if line[i] == "F" {
                result += 1
            }
        }
    } else {
        for i in stride(from: 1, through: 7, by: 2) {
            if line[i] == "F" {
                result += 1
            }
        }
    }
}

print(result)
