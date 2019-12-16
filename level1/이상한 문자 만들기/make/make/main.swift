//
//  main.swift
//  make
//
//  Created by 강병우 on 15/12/2019.
//  Copyright © 2019 강병우. All rights reserved.
//
/*
 문자열 s는 한 개 이상의 단어로 구성되어 있습니다.
 각 단어는 하나 이상의 공백문자로 구분되어 있습니다.
 각 단어의 짝수번째 알파벳은 대문자로, 홀수번째 알파벳은 소문자로 바꾼 문자열을
 리턴하는 함수, solution을 완성하세요.
 */


import Foundation

func solution(_ s:String) -> String {
    var result: String = ""
    let arr: [String] = s.split(separator: " ").map{String($0)}
    for word in arr {
        let wordArray: [String] = word.map{String($0)}
        let checkSpace: Bool = check(wordArray[0])
        for i in 0 ..< wordArray.count {
            if checkSpace {
                if i % 2 == 0 {
                    result += wordArray[i].uppercased()
                } else {
                    result += wordArray[i].lowercased()
                }
            } else {
                if i % 2 == 1 {
                    result += wordArray[i].uppercased()
                } else {
                    result += wordArray[i].lowercased()
                }
            }
        }
        
        if word != arr.last {
            result += " "
        }
    }
    return result
}

func check(_ char: String) -> Bool {
    let checkers = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
    for check in checkers {
        if char == String(check) {
            return true
        }
    }
    return false
}

let testInput = ["_sp ace", "try hello world", "Namuwiki, The tree of knowledge that we grow together"]
let testOutput = ["_Sp AcE", "TrY HeLlO WoRlD", "NaMuWiKi, ThE TrEe Of KnOwLeDgE ThAt We GrOw ToGeThEr"]

for i in 0 ..< testInput.count {
    let output = solution(testInput[i])
    if output == testOutput[i] {
        print("성공")
    } else {
        print("실패: \(testInput[i]) : \(output)")
    }
}

