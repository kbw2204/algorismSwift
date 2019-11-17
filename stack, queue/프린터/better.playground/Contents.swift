import Foundation

func solution(_ priorities:[Int], _ location:Int) -> Int {
var currentPriorities = priorities
    var myDocumentLocation = location
    var removedOrder = 0

    while(!currentPriorities.isEmpty) {
        let target = currentPriorities.removeFirst()
        let isBiggerThanTarget = currentPriorities.contains { $0 > target }
        if isBiggerThanTarget {
            currentPriorities.append(target)
            myDocumentLocation = myDocumentLocation == 0 ? currentPriorities.count - 1 : myDocumentLocation - 1
        }else {
            removedOrder += 1
            if myDocumentLocation == 0 {
                break
            }
            myDocumentLocation -= 1
        }
    }

    return removedOrder
}

let testInput = [[2, 1, 3, 2], [1, 1, 9, 1, 1, 1]]
let input2 = [2,0]
let testOutput = [1,5]

for i in 0 ..< testInput.count {
    if solution(testInput[i], input2[i]) == testOutput[i] {
        print("성공")
    } else {
        print("실패: \(testInput[i])")
    }
}

