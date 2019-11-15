import Foundation

func solution(_ numbers:[Int]) -> String {
    var result: String = ""
    let arr = numbers.map {String($0)}
    result = makeHeap(array: arr).reduce(result, +)
    while result.first! == "0" && result.count > 1 {
        result.removeFirst()
    }
    return result
}

func heapify(count: Int, array: [String]) -> [String] {
    var arr = array
    for i in 0 ..< count {
        var c = i
        while c > 0 {
            let root = (c-1)/2
            if check(c: arr[c], root: arr[root]) {
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

func check(c: String, root: String) -> Bool {
    let val1 = Int(c + root)!
    let val2 = Int(root + c)!
    if  val1 < val2 {
        return true
    }
    return false
}

let testInput = [[111,111], [3, 30, 34, 5, 9],[21, 212],[12, 121],[0,0,0,0],[0, 0, 0, 1000],[70, 0, 0, 0]]
let testOutput = ["111111","9534330","21221","12121","0","1000000","70000"]

for i in 0 ..< testInput.count {
    if solution(testInput[i]) == testOutput[i] {
        print("성공")
    } else {
        print("실패: \(testInput[i])")
    }
}
