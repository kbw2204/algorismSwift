////
////  main.swift
////  N으로 표현
////
////  Created by 강병우 on 2020/11/06.
////
//
////import Foundation
//
//var dic: [Int:Int] = [:]
//var min = 9
//
//func solution(_ N: Int, _ number: Int) -> Int {
//
//    dic[1] = 2
//    dic[11] = 3
//    dic[N] = 1
//    dic[11*N] = 2
//    dic[111*N] = 3
//    dic[1111*N] = 4
//    dfs(0, ct: 0, N, tg: number)
//    return min > 8 ? -1 : min
//}
//
//func dfs(_ sum: Int, ct: Int, _ n: Int,tg: Int) {
//    if ct >= min { return }
//    if sum == tg {
//        min = ct
//        return
//    }
//    [1,n,11*n, 111*n, 1111*n].forEach {
//        dfs(sum+$0, ct: ct+dic[$0]!, n, tg: tg)
//        dfs(sum-$0, ct: ct+dic[$0]!, n, tg: tg)
//        dfs(sum/$0, ct: ct+dic[$0]!, n, tg: tg)
//        dfs(sum*$0, ct: ct+dic[$0]!, n, tg: tg)
//    }
//}
//
//print(solution(1, 1121))
//
//// bfs 풀이
////import Foundation
////
////var countList = [Int]()
////var count = 0
////var minCount = 9
////
////  func bruteForceSearch(_ N:Int, _ number: Int) {
////
////            if count >= minCount  {
////                return
////            }
////
////            if countList.count >= minCount {
////                return
////            }
////
////            let lastNum = ((countList.count == 0) ? 0 : countList.last!)
////
////            if lastNum == number {
////                minCount = min(count, minCount)
////                return
////            }
////
////            var n = 0
////            var addCount = 0
////
////            var c = 1
////            repeat {
////
////                addCount = addCount + 1
////                if (count + addCount) >= minCount {
////                    break
////                }
////
////                n += (N * c)
////                count += addCount
////
////                let addNum = lastNum + n
////                countList.append(addNum)
////                bruteForceSearch(N, number)
////                countList.removeLast()
////
////                if (lastNum - n) != 0 {
////                    countList.append(lastNum - n)
////                    bruteForceSearch(N, number)
////                    countList.removeLast()
////                }
////
////                countList.append(lastNum * n)
////                bruteForceSearch(N, number)
////                countList.removeLast()
////
////                if (lastNum / n) != 0 {
////                    countList.append(lastNum / n)
////                    bruteForceSearch(N, number)
////                    countList.removeLast()
////                }
////
////                count -= addCount
////
////                c *= 10
////
////            } while c <= 100000
////            return
////        }
////
////func solution(_ N:Int, _ number:Int) -> Int {
////    bruteForceSearch(N, number)
////
////    return minCount < 9 ? minCount : -1
////}
//
//// 밀쿄님 풀이
//import Foundation
//
//func dfs(_ N: Int, _ number: Int, _ depth: Int, _ temp: Int, _ answer: inout Int)  {
//    if depth > 8 {
//        return
//    }
//
//    if temp == number && (answer > depth || answer == -1) {
//        answer = depth
//    }
//
//    var calc = 0
//
//    for index in 0 ..< 8 {
//        calc = calc * 10 + N
//        dfs(N, number, depth + 1 + index, temp + calc, &answer)
//        dfs(N, number, depth + 1 + index, temp - calc, &answer)
//        dfs(N, number, depth + 1 + index, temp * calc, &answer)
//        dfs(N, number, depth + 1 + index, temp / calc, &answer)
//    }
//}
//func solution(_ N:Int, _ number:Int) -> Int {
//
//    var answer = -1
//    dfs(N, number, 0, 0, &answer)
//    return answer
//}
