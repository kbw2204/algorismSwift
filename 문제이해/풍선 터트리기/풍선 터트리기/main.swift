//
//  main.swift
//  풍선 터트리기
//
//  Created by 강병우 on 2020/11/07.
//

func solution(_ a:[Int]) -> Int {
    var rst = 2
    var rm = a[a.index(a.startIndex, offsetBy: 2)...].min()!
    var lm = a[0]
    let check: (Int) -> Bool = { i in
        if a[i] == rm { rm = a[a.index(a.startIndex, offsetBy: i+1)...].min()! }
        
        if a[i] < lm {
            lm = [lm, a[i]].min()!
            return true
        }
        if a[i] < rm {
            return true
        }
        return false
    }
    
    for i in 1 ..< a.count-1 {
        if check(i) {
            rst += 1
        }
    }

    return rst
}

let a = [-16,27,65,-2,58,-92,-71,-68,-61,-33]
print(solution(a))

