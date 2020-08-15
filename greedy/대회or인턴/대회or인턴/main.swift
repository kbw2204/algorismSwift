//
//  main.swift
//  대회or인턴
//
//  Created by 강병우 on 2020/08/14.
//  Copyright © 2020 강병우. All rights reserved.
//
//import Foundation

let ipt = readLine()!.split(separator: " ").map{Int(String($0))!}
var intern = ipt.last!
var girl = ipt.first!
var man = ipt[1]
while intern > 0 {
    if girl%2 != 0 && girl > 1 {
        girl -= 1
        intern -= 1
    } else {
        if girl/2 > man {
            girl -= 1
            intern -= 1
        } else {
            man -= 1
            intern -= 1
        }
    }
}

let origin = [girl/2, man].min()!
print(origin)



