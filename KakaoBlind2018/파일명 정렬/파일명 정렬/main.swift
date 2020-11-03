//
//  main.swift
//  파일명 정렬
//
//  Created by 강병우 on 2020/11/02.
//

import Foundation

func solution(_ files:[String]) -> [String] {
    let n = files.count
    var fileList: [[String]] = Array(repeating: Array(repeating: "", count: 3), count: n) // [head,num,tail]
    
    // 정렬
    let customSort: ([String], [String]) -> Bool = { a, b in
        // head
        if a[0].lowercased() != b[0].lowercased() {
            print("\(a[0]) < \(b[0])")
            return a[0].lowercased() < b[0].lowercased() // 다르다면 사전순정렬
        } else {
            if let n1 = Int(a[1]), let n2 = Int(b[1]), n1 != n2 {
                return n1 < n2 // 숫자다르다면 큰순으로 정렬
            }
        }
        
        return false // 문자도 같고 숫자도 같다면 안바꿈
    }
    
    // 변환
    for (i,file) in files.enumerated() {
        var state = 0 // 0-head,1-num,2-tail
        var count = 0
        file.forEach {
            if state == 0 { // HEAD는 숫자가 아닌 문자로 이루어져 있으며, 최소한 한 글자 이상이다.
                if $0.isLetter || [" ", ".", "-"].contains($0) {
                    fileList[i][state].append($0)
                } else {
                    state = 1
                    fileList[i][state].append($0)
                }
            } else if state == 1 { // NUMBER는 한 글자에서 최대 다섯 글자 사이의 연속된 숫자로 이루어져 있으며, 앞쪽에 0이 올 수 있다. 0부터 99999 사이의 숫자로, 00000이나 0101 등도 가능하다. 숫자를 하나 이상 포함하고 있기 때문에 꼭 여기서 한번 걸린다.
                if $0.isNumber && count < 4 {
                    fileList[i][state].append($0)
                    count += 1
                }
                else {
                    state = 2
                    fileList[i][state].append($0)
                }
            } else { // TAIL은 그 나머지 부분으로, 여기에는 숫자가 다시 나타날 수도 있으며, 아무 글자도 없을 수 있다.
                fileList[i][state].append($0)
            }
        }
    }
    
    fileList.sort(by: customSort)
    return fileList.map{$0.joined()}
}

let ipt = ["a1","c1","b1"]
let rst = solution(ipt)
print(rst)

// MARK: - 더 좋은 풀이
//extension String{
//    var numeric: ClosedRange<Character> { return "0"..."9" }
//    var head: String{
//        return self.prefix { numeric.contains($0) == false }.uppercased()
//    }
//    var number: Int {
//        return Int( self.drop   { numeric.contains($0) == false}
//                        .prefix { numeric.contains($0) == true })!
//    }
//}
//
//func solution(_ files:[String]) -> [String] {
//
//    return files.enumerated().sorted { (lhs, rhs) in
//        let l = lhs.element
//        let r = rhs.element
//        if l.head != r.head { return l.head < r.head}
//        if l.number != r.number { return l.number < r.number}
//        return lhs.offset < rhs.offset
//
//    }.map{ $0.element }
//}
