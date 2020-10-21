//
//  main.swift
//  jadenCase문자열 만들기
//
//  Created by 강병우 on 2020/10/21.
//

import Foundation

func solution(_ s:String) -> String {
    var arr: [String] = []
    var tmp: [Character] = []
    var idx = 0
    
    while idx != s.count {
        while s[s.index(s.startIndex, offsetBy: idx)] != " " {
            tmp.append(s[s.index(s.startIndex, offsetBy: idx)])
            idx += 1
            if idx >= s.count { break }
        }
        arr.append(String(tmp))
        tmp.removeAll()
        idx += 1
        if idx >= s.count { break }
        while !(s[s.index(s.startIndex, offsetBy: idx)].isLetter || s[s.index(s.startIndex, offsetBy: idx)].isNumber) {
            tmp.append(s[s.index(s.startIndex, offsetBy: idx)])
            idx += 1
            if idx >= s.count { break }
        }
    }
    
    var result = ""
    for word in arr {
        var word = word
        if word.first != " " {
            let tmp = word.removeFirst()
            result += tmp.uppercased() + word.lowercased() + " "
        } else {
            var key = false
            for c in word {
                if c == " " {
                    result += " "
                } else {
                    if key {
                        result += c.lowercased()
                    } else {
                        result += c.uppercased()
                        key = true
                    }
                }
            }
            result += " "
        }
    }
    if s.last != " " { result.removeLast() }

    return result
}

let s = "3people unFollowed     me "
let rs = solution(s)
print(rs)


// 더 좋은 풀이
//
//import Foundation
//
//extension StringProtocol {
//  var firstUppercased: String {
//    guard let first = first else { return "" }
//    return String(first).uppercased() + dropFirst()
//  }
//}
//
//func solution(_ s:String) -> String {
//
//    guard s.count > 1 else { return s }
//
//  let lowerArr: [String] = s.lowercased().components(separatedBy: CharacterSet.whitespaces)
//
//  var result: String = lowerArr.reduce("") { r, str -> String in
//    return "\(r) \(str.firstUppercased)"
//  }
//
//    if result.first == " " { result.removeFirst() }
//
//  return result
//}
