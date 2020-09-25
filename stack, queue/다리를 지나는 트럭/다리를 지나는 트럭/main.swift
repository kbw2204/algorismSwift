//
//  main.swift
//  다리를 지나는 트럭
//
//  Created by 강병우 on 2020/04/22.
//  Copyright © 2020 강병우. All rights reserved.

func solution(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {
    var time = 0
    var truckList = truck_weights.reversed().map{Int($0)}
    var onTructList: [Int] = []
    var 진행거리: [Int] = []
    
    let run: (Int) -> () = { i in
        onTructList.append(i)
        진행거리.append(1)
    }
    
    let checkArrive = {
        if let first = 진행거리.first {
            if first > bridge_length {
                onTructList.removeFirst()
                진행거리.removeFirst()
            }
        }
    }
    
    let going = {
        진행거리 = 진행거리.map{$0+1}
        time += 1
    }
    
    while !onTructList.isEmpty || !truckList.isEmpty {
        going()
        checkArrive()
        if let first = truckList.last {
            let sum = onTructList.reduce(0, +)
            if sum + first <= weight {
                run(truckList.removeLast())
            }
        }
    }
    
    return time
}

print(solution(2, 10, [7,4,5,6]))
