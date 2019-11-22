import Foundation
// 일 십 백 천 만 십만 백만 천만 억
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

func solution(_ input: String) -> String {
    var inputString = input
    var indexArray2: [String] = []
    var indexArray: [Int] = []
    var arr: [String] = []
    var postfix: String = ""
    var resultInt: Int = 0
    if input.contains("억") && !input.contains("일억"){
        return "err"
    }
    // 한글 숫자랑 index값을 치환 -> indexArray에 넣어줌
    indexArray2 = input.components(separatedBy: [" ", "+", "-", "/", "*", "(", ")"]).filter{$0 != ""}.map{String($0)}.sorted(by: {$0.count > $1.count})
    for toInt in indexArray2 {
        indexArray.append(makeInt(toInt))
    }
    inputString = input.components(separatedBy: " ").joined()
    
    for i in 0 ..< indexArray2.count {
        inputString = inputString.replacingOccurrences(of: indexArray2[i], with: String(i))
    }

    arr = inputString.components(separatedBy: " ").joined().map{String($0)}
    postfix = convertPostfix(arr)
    resultInt = calculatePostfix(str: postfix, index: indexArray)

    return makeString(number: resultInt)
}

func makeString(number: Int) -> String {
    var result: String = ""
    let pos = ["","십","백","천","만","십","백","천","억"]
    let dic: [Int:String] = [1:"일",2:"이",3:"삼",4:"사",5:"오",6:"육",7:"칠",8:"팔",9:"구"]
    var num = number
    if num < 0 {
        result += "-"
        num = abs(number)
    }
    var strArray = String(num).map{String($0)}
    while strArray.count > 0 {
        if let val = dic[Int(strArray.removeFirst())!] {
            result += val
            result += pos[strArray.count]
        }
    }
    return result
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

func  calculatePostfix(str: String, index: [Int]) -> Int {
    let stack: Stack = Stack()
    var indexArray = index
    let arr = str.map{$0}
    var op1 = 0
    var op2 = 0
    for i in 0 ..< arr.count {
        let ch = String(arr[i])
        if ch == "+" {
            op2 = indexArray[Int(stack.pop())!]
            op1 = indexArray[Int(stack.pop())!]
            indexArray.append(op1 + op2)
            stack.push(String(indexArray.count-1))
        } else if ch == "*" {
            op2 = indexArray[Int(stack.pop())!]
            op1 = indexArray[Int(stack.pop())!]
            indexArray.append(op1 * op2)
            stack.push(String(indexArray.count-1))
        } else if ch == "-" {
            op2 = indexArray[Int(stack.pop())!]
            op1 = indexArray[Int(stack.pop())!]
            indexArray.append(op1 - op2)
            stack.push(String(indexArray.count-1))
        } else if ch == "/" {
            op2 = indexArray[Int(stack.pop())!]
            op1 = indexArray[Int(stack.pop())!]
            indexArray.append(op1 / op2)
            stack.push(String(indexArray.count-1))
        } else {
            stack.push(String(ch.unicodeScalars))
        }
    }
    return indexArray[Int(stack.pop())!]
}

func convertPostfix(_ arr: [String]) -> String {
    let stack: Stack = Stack()
    var postfix: [String] = []
    for i in 0 ..< arr.count {
        let ch = String(arr[i])
        if ch == "(" {
            continue
        } else if ch == "+" || ch == "-" || ch == "*" || ch == "/" {
            stack.push(ch)
        } else if ch == ")" {
            postfix.append(stack.pop())
        } else {
            postfix.append(ch)
        }
    }
    while !stack.empty() {
        postfix.append(stack.pop())
    }
    return postfix.reduce("",+)
}


let testInput = ["(이백삼십사 - 이십삼) - (십사 * 삼) / 이","이백 + ((오천 - 일만) + 이천)","사십이 - ((팔십이 + 일백이십) * 삼) / 이", "이억오천 - (구 + 삼십이)", "일억 - 구"]
let testOutput = ["일백구십","-이천팔백", "-이백육십일", "err", "구천구백구십구만구천구백구십일"]

for i in 0 ..< testInput.count {
    let output = solution(testInput[i])
    if output == testOutput[i] {
        print("성공: \(output)")
    } else {
        print("실패: \(testInput[i]) : \(output)")
    }
}
