//
//  main.swift
//  KMP는 왜 KMP일까?
//
//  Created by 강병우 on 2020/08/12.
//  Copyright © 2020 강병우. All rights reserved.
//

var result = ""

readLine()!.split(separator: "-").map{String($0.first!)}.forEach {
    result += $0
}

print(result)
