//
//  main.swift
//  test
//
//  Created by 강병우 on 20/11/2019.
//  Copyright © 2019 강병우. All rights reserved.
//

extension String {
    subscript(r: Range<Int>) -> String {
        let start = self.index(self.startIndex, offsetBy: r.lowerBound)
        let end = self.index(self.startIndex, offsetBy:  r.upperBound)
        
        return String(self[start..<end])
    }
}

func solution(_ s:String) -> String {
    
    if s.count % 2 == 1 {
        return s[s.count/2 ..< (s.count/2) + 1]
    } else {
        return s[(s.count/2) - 1 ..< (s.count/2) + 1]
    }
}

let testInput = ["abcde","qwer"]
let testOutput = ["c", "we"]

for i in 0 ..< testInput.count {
    let output = solution(testInput[i])
    if output == testOutput[i] {
        print("성공")
    } else {
        print("실패: \(testInput[i]) : \(output)")
    }
}
