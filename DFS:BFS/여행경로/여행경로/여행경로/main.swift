//
//  main.swift
//  여행경로
//
//  Created by 강병우 on 2020/04/30.
//  Copyright © 2020 강병우. All rights reserved.
//

// 항공권 모두 이용이니깐 depth == 티켓수 + 1
// 결국 돌아오는 값은 하나임
import Foundation

func solution(_ tickets:[[String]]) -> [String] {
    var result: [String] = []
    dfs(tickets: tickets, history: [], result: &result, end: "", count: tickets.count + 1, depth: 0)
    return result
}

func dfs(tickets: [[String]], history: [String], result: inout [String],end: String, count: Int, depth: Int) {
    if history.count == count {
        if result.isEmpty {
            result = history
        } else {
            for i in 0 ..< history.count {
                if result[i] > history[i] {
                    result = history
                    break
                } else if result[i] == history[i] {
                    continue
                } else if result[i] < history[i] {
                    break
                }
            }
        }
        return
    }
    if history.first != "ICN" && depth != 0 {
        return
    }
    
    for i in 0 ..< tickets.count {
        var varTickets = tickets
        var varHistory = history
        let selected = varTickets.remove(at: i)
        let start = selected[0]
        let arrived = selected[1]
        
        if history.isEmpty {
            varHistory.append(start)
            varHistory.append(arrived)
            dfs(tickets: varTickets, history: varHistory, result: &result, end: arrived, count: count, depth: depth + 1)
        } else {
            if start == history.last {
                varHistory.append(arrived)
                dfs(tickets: varTickets, history: varHistory, result: &result, end: arrived, count: count, depth: depth + 1)
            }
        }
        
    }
}

let tickets = [["ICN", "JFK"], ["HND", "IAD"], ["JFK", "HND"]]
let tickets2 = [["ICN", "SFO"], ["ICN", "ATL"], ["SFO", "ATL"], ["ATL", "ICN"], ["ATL","SFO"]]
let result = solution(tickets2)

print(result)
