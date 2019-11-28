import Foundation

//func solution(_ a:Int, _ b:Int) -> String {
//
//    let w = ["THU", "FRI", "SAT", "SUN", "MON", "TUE", "WED"]
//    let monthDay = [ 31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
//    let totalDay = monthDay[0..<a-1].reduce(0, +) + b
//
//    return w[totalDay % 7]
//}

func solution(_ a:Int, _ b:Int) -> String {
  var accumaltedDays = b - 1
  for i in 1..<a { accumaltedDays += numberOfDays(month: i) }
  let dayArray = ["FRI", "SAT", "SUN", "MON", "TUE", "WED", "THU"]
  return dayArray[accumaltedDays % 7]
}


func numberOfDays(month: Int) -> Int {
  switch month {
  case 1, 3, 5, 7, 8, 10, 12:
    return 31
  case 4, 6, 9, 11:
    return 30
  case 2:
    return 29
  default:
    return 0
  }
}

let testInput = [5, 3, 3, 1]
let testInput2 = [24, 14, 22,3]
let testOutput = ["TUE", "MON", "TUE", "SUN"]

for i in 0 ..< testInput.count {
    let output = solution(testInput[i], testInput2[i])
    if output == testOutput[i] {
        print("성공")
    } else {
        print("실패: \(testInput[i]) : \(output)")
    }
}
