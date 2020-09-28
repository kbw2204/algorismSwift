//
//  main.swift
//  최댓값과 최솟값
//
//  Created by 강병우 on 2020/09/29.
//

func solution(_ s:String) -> String {
    let ipt = s.split(separator: " ").map{Int(String($0))!}
    return "\(ipt.min()!) \(ipt.max()!)"
}

let rs = solution("-1 -2 -3 -4")
print(rs)
