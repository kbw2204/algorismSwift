//
//  main.swift
//  불량사용자
//
//  Created by 강병우 on 2020/04/24.
//  Copyright © 2020 강병우. All rights reserved.
//

import Foundation

func solution(_ user_id:[String], _ banned_id:[String]) -> Int {
    var result: [[String]] = []
    for banID in banned_id {
        var list: [String] = []
        for user in user_id {
            if checkStr(userStr: user, banStr: banID) {
                list.append(user)
            }
        }
        result.append(list)
    }
    print(result)
    var resultSet: Set<Set<String>> = []
    run(result: result, depth: 0, set: Set<String>(), resultSet: &resultSet)
    print(resultSet)
    return resultSet.count
}

func run(result: [[String]], depth: Int, set: Set<String>, resultSet: inout Set<Set<String>>) {
    if depth == result.count {
        if set.count == depth {
            resultSet.insert(set)
            print(set)
        } else {
            print("갯수틀림: \(set)")
        }
        return
    }
    for word in result[depth] {
        var varSet = set
        varSet.insert(word)
        run(result: result, depth: depth+1, set: varSet, resultSet: &resultSet)
    }
}

func checkStr(userStr: String, banStr: String) -> Bool {
    guard userStr.count == banStr.count else {
        return false
    }
    
    for i in 0 ..< banStr.count {
        let userIndex = userStr.index(userStr.startIndex, offsetBy: i)
        let banIndex = banStr.index(banStr.startIndex, offsetBy: i)
        if userStr[userIndex] != banStr[banIndex] {
            if banStr[banIndex] != "*" {
                return false
            } else {
                continue
            }
        }
    }
    return true
}

let testInput = [["frodo", "fradi", "crodo", "abc123", "frodoc"], ["frodo", "fradi", "crodo", "abc123", "frodoc"]]
let testInput2 = [["fr*d*", "abc1**"], ["fr*d*", "*rodo", "******", "******"]]
let testOutput = [2,3]

for i in 0 ..< testInput.count {
    let output = solution(testInput[i], testInput2[i])
    if output == testOutput[i] {
        print("성공")
    } else {
        print("실패: \(testInput[i]) : \(output)")
    }
}
