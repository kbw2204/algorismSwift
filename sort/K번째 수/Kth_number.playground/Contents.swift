// 내 풀이

//import Foundation
//
//func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {
//    var resultArray: [Int] = []
//    for command in commands {
//        var arr = Array(array[command[0]-1...command[1]-1])
//        arr = makeHeap(array: arr)
//        resultArray.append(arr[command[2]-1])
//    }
//    return resultArray
//}
//
//func heapify(count: Int, array: [Int]) -> [Int] {
//    var arr = array
//    for i in 0 ..< count {
//        var child = i
//        while child > 0 {
//            let root = (child - 1) / 2
//            if arr[child] > arr[root] {
//                arr.swapAt(child, root)
//            }
//            child = root
//        }
//    }
//    return arr
//}
//
//func makeHeap(array: [Int]) -> [Int] {
//    var arr = array
//    arr = heapify(count: arr.count, array: arr)
//    for i in (0 ..< arr.count).reversed() {
//        arr.swapAt(0, i)
//        arr = heapify(count: i, array: arr)
//    }
//    return arr
//}

// 더 좋은 풀이
import Foundation

func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    return commands.map({
        array[($0[0]-1)...($0[1]-1)].sorted()[$0[2]-1]
    })
    
}

var arr: [Int] = [1, 5, 2, 6, 3, 7, 4]
let commands = [[2, 5, 3], [4, 4, 1], [1, 7, 3]]

print(solution(arr, commands))

