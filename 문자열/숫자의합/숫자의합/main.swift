//
//  main.swift
//  숫자의합
//
//  Created by 강병우 on 2020/07/13.
//  Copyright © 2020 강병우. All rights reserved.
//

let _ = readLine()!
print(readLine()!.map{Int(String($0))!}.filter{$0 != 0}.reduce(0, +))

