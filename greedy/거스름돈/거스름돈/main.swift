//
//  main.swift
//  거스름돈
//
//  Created by 강병우 on 2020/08/14.
//  Copyright © 2020 강병우. All rights reserved.
//

var remain = 1000 - Int(readLine()!)!
var result = 0
[500,100,50,10,5,1].forEach {
    if remain >= $0 {
        let count = remain / $0
        result += count
        remain -= count*$0
    }
}
print(result)
