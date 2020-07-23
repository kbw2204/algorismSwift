//
//  main.swift
//  한수
//
//  Created by 강병우 on 2020/07/23.
//  Copyright © 2020 강병우. All rights reserved.
//

//import Foundation

func check(_ n: Int) -> Int {
    var count = 99
    for i in 100 ... n {
        let arr = String(i).map{Int(String($0))!}
        if arr.first! + arr.last! == 2*arr[1] {
            count += 1
        }
    }
    return count
}


let ipt = Int(readLine()!)!
if ipt < 100 {
    print(ipt)
} else if ipt < 1000 {
    print(check(ipt))
} else if ipt == 1000 {
    print(check(999))
}



