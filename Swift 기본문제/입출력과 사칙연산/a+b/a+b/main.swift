//
//  main.swift
//  a+b
//
//  Created by 강병우 on 2020/06/13.
//  Copyright © 2020 강병우. All rights reserved.
//

import Foundation

print(readLine()!.split(separator: " ").map{Int(String($0))!}.reduce(0, {$0+$1}))

