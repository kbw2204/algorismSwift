import Foundation

/*
 1. 첫째자리수가 가장 큰 수별로 sort
 2. 위 과정에서 최고자리수가 같을경우 그 다음번째수가 가장 큰 수별로 sort해야함
 3. 위 과정에서 또 같은경우 그 다음번째...
 */

extension String {
    subscript(r: Range<Int>) -> String {
        let start = self.index(self.startIndex, offsetBy: r.lowerBound)
        let end = self.index(self.startIndex, offsetBy:  r.upperBound)
        
        return String(self[start..<end])
    }
}

func solution(_ numbers:[Int]) -> String {
    var result: String = ""
    //    var arr = numbers.map {Int(String(String($0).first!))!}
    var arr = numbers.map{String($0)}
    arr = makeHeap(array: arr)
    for num in arr {
        if num != "0" {
            result += num
        }
    }
    if result == "" {
        result = "0"
    }
    return result
}

func check(arr: [String], c: Int, root: Int, index: Int) -> Bool {
    if Int(arr[c][index..<index+1])! < Int(arr[root][index..<index+1])! {
        return true
    } else if Int(arr[c][index..<index+1])! == Int(arr[root][index..<index+1])! && Int(arr[c][index..<index+1])! != 0 {
        if arr[c].count == arr[root].count {
            if index < arr[c].count - 1 {
                return check(arr: arr, c: c, root: root, index: index + 1)
            }
        } else {
            if arr[c].count < arr[root].count {
                if Int(arr[root][index+1..<index+2])! > Int(arr[c][index..<index+1])!*10 {
                    return true
                }
            } else{
                if Int(arr[c][index+1..<index+2])! > Int(arr[root][index..<index+1])!*10 {
                    return true
                }
            }
        }
    }
    return false
}

func heapify(count: Int, array: [String]) -> [String] {
    var arr = array
    for i in 0 ..< count {
        var c = i
        while c > 0 {
            let root = (c-1)/2
            if check(arr: arr, c: c, root: root, index: 0) {
                arr.swapAt(c, root)
            }
            c = root
        }
    }
    return arr
}

func makeHeap(array: [String]) -> [String] {
    var arr = array
    arr = heapify(count: arr.count, array: arr)
    for i in (0 ..< arr.count).reversed() {
        arr.swapAt(0, i)
        arr = heapify(count: i, array: arr)
    }
    return arr
}

var arr1 = [111,111]
let arr2 = [3, 30, 34, 5, 9]
let arr3 = [21, 212]
let arr4 = [12, 121]
//print(solution(arr1))
print(solution(arr2))
print(solution(arr3))
print(solution(arr4))

