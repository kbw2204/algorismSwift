//
//  main.swift
//  압축
//
//  Created by 강병우 on 2020/11/01.
//

import Foundation

func solution(_ msg:String) -> [Int] {
    var rst: [Int] = []
    let msg = msg.map{String($0)}
    var dic: [String:Int] = [:]
    for i in 1 ... 26 {
        dic[String(UnicodeScalar(64+i)!)] = i // A ~ 65
    }
    var pos = 0
    var count = 26
    var max = 1
    
    let 압축: () -> String = {
        var tmp = msg[pos]
        var w = msg[pos]
        // 2. 가장 긴 문자열 찾기
        if pos+1 < msg.count {
            var tmpMax = max
            for i in pos+1 ..< msg.count {
                if tmpMax == 0 { break }
                tmp += msg[i]
                if dic[tmp] != nil { w = tmp }
                tmpMax -= 1
            }
        }
    
        // 3. w에 해당하는 사전의 색인 번호를 출력하고, 입력에서 w를 제거한다.
        if let idx = dic[w] {
            rst.append(idx) // 출력
//            if w.count != 1 { dic.removeValue(forKey: w) } // 제거, 길이 1 초기화
        }

        // 4.입력에서 처리되지 않은 다음 글자가 남아있다면(c), w+c에 해당하는 단어를 사전에 등록한다.
        if pos+w.count < msg.count {
            count += 1
            let ipt = w+msg[pos+w.count]
            dic[ipt] = count // 추가
            if ipt.count > max { max = ipt.count }
        }
        
        return w
    }
    
    while pos < msg.count {
        pos += 압축().count
    }
    
    return rst
}

let rst = solution("THATTHATISISTHATTHATISNOTISNOTISTHATITITISTHATTHATISISTHATTHATISNOTISNOTISTHATITITISTHATTHATISISTHATTHATISNOTISNOTISTHATITITISTHATTHATISISTHATTHATISNOTISNOTISTHATITITISTHATTHATISISTHATTHATISNOTISNOTISTHATITITISTHATTHATISISTHATTHATISNOTISNOTISTHATITITISTHATTHATISISTHATTHATISNOTISNOTISTHATITITISTHATTHATISISTHATTHATISNOTISNOTISTHATITITISTHATTHATISISTHATTHATISNOTISNOTISTHATITITISTHATTHATISISTHATTHATISNOTISNOTISTHATITITISTHATTHATISISTHATTHATISNOTISNOTISTHATITITISTHATTHATISISTHATTHATISNOTISNOTISTHATITITISTHATTHATISISTHATTHATISNOTISNOTISTHATITITISTHATTHATISISTHATTHATISNOTISNOTISTHATITITISTHATTHATISISTHATTHATISNOTISNOTISTHATITITISTHATTHATISISTHATTHATISNOTISNOTISTHATITITISTHATTHATISISTHATTHATISNOTISNOTISTHATITITISTHATTHATISISTHATTHATISNOTISNOTISTHATITITISTHATTHATISISTHATTHATISNOTISNOTISTHATITITISTHATTHATISISTHATTHATISNOTISNOTISTHATITITISTHATTHATISISTHATTHATISNOTISNOTISTHATITITISTHATTHATISISTHATTHATISNOTISNOTISTHATITITISTHATTHATISISTHATTHATISNOTISNOTISTHATITITIS")
rst == [20, 8, 1, 20, 27, 29, 9, 19, 33, 31, 30, 28, 20, 33, 14, 15, 39, 19, 41, 43, 36, 9, 39, 46, 38, 47, 34, 19, 36, 52, 45, 40, 42, 35, 38, 48, 62, 54, 51, 61, 53, 55, 66, 57, 44, 59, 64, 32, 49, 60, 29, 52, 76, 37, 32, 71, 43, 70, 47, 75, 73, 80, 43, 79, 56, 72, 84, 61, 86, 68, 81, 90, 69, 92, 72, 85, 63, 96, 89, 87, 91, 83, 101, 94, 103, 65, 97, 106, 99, 108, 50, 74, 111, 77, 66, 98, 81, 70, 93, 118, 117, 88, 33, 122, 116, 58, 127, 62, 127, 78, 114, 123, 100, 133, 95, 112, 105, 104, 132, 145, 87, 134, 130, 129, 137, 131, 82, 79, 148, 151, 150, 144, 153, 159, 102, 135, 121, 156, 159, 125, 75, 162, 113, 158, 124, 109, 126, 149, 67, 142, 146, 166, 155, 158, 174, 171, 140, 119, 128, 175, 120, 138, 152, 161, 174, 181, 139, 154, 141, 187, 143, 176, 165, 172, 167, 191, 164, 182, 194, 184, 136, 170, 193, 147, 86] ? print("o") : print("x: \(rst)")
        
