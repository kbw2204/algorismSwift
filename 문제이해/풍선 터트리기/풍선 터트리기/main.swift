//
//  main.swift
//  풍선 터트리기
//
//  Created by 강병우 on 2020/11/07.
//

func solution(_ a:[Int]) -> Int {
    let check: (Int) -> Bool = { i in
        let lm = a[..<a.index(a.startIndex, offsetBy: i)].min()!
        if a[i] < lm { return true }
        let rm = a[a.index(a.startIndex, offsetBy: i+1)...].min()!
        return a[i] < rm
    }
    
    return Array(1...a.count-2).map{check($0)}.filter{$0==true}.count + 2
}

let a = [-16,27,65,-2,58,-92,-71,-68,-61,-33]
print(solution(a))

