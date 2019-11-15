import Foundation

func solution(_ s:String) -> [Int] {
    var result: [Int] = []
    
    // 양쪽 자르자
    let range = s.index(after: s.startIndex)..<s.index(before: s.endIndex)
    var array: [String] = String(s[range]).components(separatedBy: ["{", "}"])
    var list: [String] = []
    for i in 0 ..< array.count / 2 {
        list.append(array[i*2+1])
    }
    list = heapSort(array: list)
    result.append(Int(list[0])!)
    for i in 1 ..< list.count {
        let arr1 = Set<String>(list[i].components(separatedBy: ","))
        let arr2 = Set<String>(list[i-1].components(separatedBy: ","))
        
        let addValue: [Int] = arr1.subtracting(arr2).map{Int($0)!}
        result.append(addValue[0])
    }
    return result
}

func heapify(_ count: Int,_ array: [String]) -> [String] {
    var heapArray = array
    for i in 0 ..< count {
        var child = i
        while child > 0 {
            let root: Int = (child - 1) / 2
            if heapArray[root].count < heapArray[child].count {
                heapArray.swapAt(root, child)
            }
            child = root
        }
    }
    return heapArray
}

func heapSort(array: [String]) -> [String] {
    var heapArray = array
    let count = heapArray.count
    heapArray = heapify(count, heapArray)
    for i in (0 ..< count).reversed() {
        heapArray.swapAt(0, i)
        heapArray = heapify(i, heapArray)
    }
    return heapArray
}
print(solution("{{2},{2,1},{2,1,3},{2,1,3,4}}"))
print(solution("{{20,111},{111}}"))
