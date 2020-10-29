//
//  main.swift
//  캐시
//
//  Created by 강병우 on 2020/10/29.
//

//import Foundation

func solution(_ cacheSize:Int, _ cities:[String]) -> Int {
    if cacheSize == 0 { return cities.count*5 }
    var cache: [String:Int] = [:]
    var cacheForKey: [Int:String] = [:]
    var idxList: Set<Int> = []
    var rst = 0
    var idx = 0

    let update: (Int, String) -> () = { index, ipt in
        cache[ipt] = idx
        cacheForKey[idx] = ipt
        idxList.remove(index)
        idxList.insert(idx)
        idx += 1
        rst += 1
    }

    let insert: (String) -> () = { ipt in
        cache[ipt] = idx
        cacheForKey[idx] = ipt
        idxList.insert(idx)
        idx += 1
        rst += 5
    }

    let newData: (Int, String, String) -> () = { min, key, ipt in
        cache.removeValue(forKey: key)
        cache[ipt] = idx // 갱신
        cacheForKey.removeValue(forKey: min)
        cacheForKey[idx] = ipt
        idxList.remove(min)
        idxList.insert(idx)
        idx += 1
        rst += 5
    }

    cities.forEach {
        let ipt = $0.lowercased()
        if cache.count < cacheSize {
            if let index = cache[ipt] {
                update(index, ipt)
            } else {
                insert(ipt)
            }
        } else {
            // 값이 있다면
            if let index = cache[ipt] {
                update(index, ipt)
            } else {
                // 가장 오래된 것 삭제
                if let min = idxList.min(), let key = cacheForKey[min] {
                    newData(min, key, ipt)
                }
            }
        }
    }

    return rst
}

// 깔끔해보이는 코드.. 속도는 딕셔너리가 더 빨랐다.
//func solution(_ cacheSize:Int, _ cities:[String]) -> Int {
//    if cacheSize == 0 { return cities.count*5 }
//    var rst = 0
//    var cache: [String] = []
//    let LRU: (String) -> () = { ipt in
//        if cache.contains(ipt) { cache.remove(at: cache.firstIndex(of: ipt)!)}
//        if cache.count == cacheSize { cache.removeLast() }
//        cache.insert(ipt, at: 0)
//    }
//
//    cities.forEach {
//        let ipt = $0.lowercased()
//        if cache.contains(ipt) { rst += 1}
//        else { rst += 5}
//        LRU(ipt)
//    }
//
//    return rst
//}

let cs = ["Jeju", "Jeju", "Jeju"]
let rs = solution(2, cs)
print(rs)
