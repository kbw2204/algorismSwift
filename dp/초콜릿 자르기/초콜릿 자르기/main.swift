//
//  main.swift
//  초콜릿 자르기
//
//  Created by 강병우 on 2020/07/02.
//  Copyright © 2020 강병우. All rights reserved.
//

print(readLine()!.split(separator: " ").map{Int($0)!}.reduce(1, {$0*$1}) - 1)
