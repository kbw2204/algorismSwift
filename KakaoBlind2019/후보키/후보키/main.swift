//
//  main.swift
//  후보키
//
//  Created by 강병우 on 2020/10/30.
//

import Foundation

func solution(_ relation:[[String]]) -> Int {
    let n = relation[0].count // 칼럼 수
    let arr = Array(repeating: 0, count: n)
    var idxList: [[Int]] = []
    var unicKey: [Int] = []
    for i in 0 ..< n {
        if check(idxList: [i], relation: relation) {
            unicKey.append(i)
        }
    }
    if n > 1 {
        for r in 2 ... n {
            combination(arr, 0, n, r, 0, relation, &idxList, unicKey: unicKey)
        }
    }
    
//    print(idxList)
//    print(superKey)
    return idxList.count + unicKey.count
}

// data: 데이터 리스트, list: 뽑을 데이터의 idx 정보, r: 뽑을 갯수
func combination(_ arr: [Int], _ idx: Int, _ n: Int, _ r: Int, _ depth: Int, _ relation: [[String]], _ idxList: inout [[Int]], unicKey: [Int]){
    if r == 0 {
        var tmp: [Int] = []
        for i in 0 ..< idx {
            if !unicKey.contains(arr[i]) {
                tmp.append(arr[i])
            }
        }
        if check(idxList: tmp, relation: relation) && !idxList.contains(tmp) && 유일성검사(idxList: tmp, relation: relation) {
            idxList.append(tmp)
        }
    }
    else if depth == n { return }
    else {
        var arr = arr
        arr[idx] = depth
        combination(arr, idx+1, n, r-1, depth+1, relation, &idxList, unicKey: unicKey)
        combination(arr, idx, n, r, depth+1, relation, &idxList, unicKey: unicKey)
    }
}

func check(idxList: [Int], relation: [[String]]) -> Bool {
    var tmp: [String] = []
    for rls in relation {
        var str = ""
        idxList.forEach {
            str += "\(rls[$0])-"
        }
        if tmp.contains(str) {
//            print("중복: \(str), idxList: \(idxList)")
//            print("list: \(tmp)")
            return false
        } else {
            tmp.append(str)
        }
    }
    
    return true
}

func 유일성검사(idxList: [Int], relation: [[String]]) -> Bool {
    if idxList.count == 2 { return true}
    for i in 0 ..< idxList.count {
        var idxList = idxList
        idxList.remove(at: i)
        if check(idxList: idxList, relation: relation) { return false }
    }
    return true
}


let dt = [["100","ryan","music","2"],
          ["200","apeach","math","2"],
          ["300","tube","computer","3"],
          ["400","con","computer","4"],
          ["500","muzi","music","3"],
          ["600","apeach","music","2"]]
print(solution(dt))
