import Foundation

class Stack {
    var stack: [String] = []
    
    func push(_ val: String) {
        stack.append(val)
    }

    func pop() -> String {
        return stack.isEmpty ? "-1" : stack.removeLast()
    }

    func size() -> Int {
        return stack.count
    }

    func empty() -> Bool {
        return stack.isEmpty ? true : false
    }

    func top() -> String {
        guard let val: String = stack.last else {
            return "-1"
        }
        return val
    }
}

func convert(_ str: String) -> Int {
    let input = str.map{$0}
    var result: Int = 0
    var tempInt: Int = 1
    var pos = 0

    //    만을 기준으로 먼저 잘라야지, 천-백-십
    while input.count > pos {
        if let val = checkNum(input[pos]) {
            tempInt = val
            pos += 1
        }
        if input.count > pos, let val = checkDigit(input[pos]) {
            tempInt = tempInt*val
            pos += 1
        }
        result += tempInt
        tempInt = 1
    }
    return result
}

func checkNum(_ c: Character) -> Int? {
    var result: Int?
    let dic: [String:Int] = ["일":1,"이":2,"삼":3,"사":4,"오":5,"육":6,"칠":7,"팔":8,"구":9]
    if let val = dic[String(c)] {
        result = val
    } else {
        return nil
    }
    return result
}

func checkDigit(_ c: Character) -> Int? {
    var result: Int?
    let dic: [String:Int] = ["십":10, "백":100, "천":1000]
    if let val = dic[String(c)] {
        result = val
    } else {
        return nil
    }
    return result
}

func makeInt(_ str: String) -> Int {
    var num = 0
    if str.contains("만") {
        let index = str.firstIndex(of: "만") ?? str.endIndex
        let index2 = str.index(after: index)
        num += convert(String(str[..<index])) * 10000
        num += convert(String(str[index2...]))
    } else if str.contains("억"){
        num = 100000000
    } else {
        num += convert(str)
    }
    return num
}

print(makeInt("구천오백십일만삼천팔백일"))
