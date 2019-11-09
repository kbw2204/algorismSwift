import Foundation

func solution(_ k:Int64, _ room_number:[Int64]) -> [Int64] {
    var result: [Int64] = []
    
    var room = Array<Bool>(repeating: false, count: Int(k))
    for i in 0..<room_number.count {
        let key = checkRoom(room: room, subKey: room_number[i])
        room[Int(key - 1)] = true
        result.append(key)
    }
    
    return result
}

func checkRoom(room: [Bool], subKey: Int64) -> Int64 {
    var key = subKey
    if key > room.count {
        key = 1
    }
    if !room[Int(key - 1)] {
        return key
    } else {
        return checkRoom(room: room, subKey: key + 1)
    }
}

print("답: \(solution(10, [1,1,1,9,9,9,9,9,9,9]))")
