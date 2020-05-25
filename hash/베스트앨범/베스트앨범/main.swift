/*
가장 많이 재생된 노래 2개 뽑을꺼
 노래엔 고유번호가 있음(구분)
 
 노래 수록 기준
 1. 장르
 2. 장르 내 노래 재생수
 3. 1,2번중 고유번호 낮은순
 gen - 장르
 plays - 재생횟수
 
 베스트 앨범에 들어갈 노래의 고유 번호를 순서대로 return 하도록 solution 함수를 완성하세요.
*/

import Foundation

func getIndex(str: String, count: Int) -> Int {
    return abs(str.hashValue) % count
}

func sum(arr: [Int]) -> Int {
    return arr.reduce(0, {$0+$1})
}

func solution(_ genres:[String], _ plays:[Int]) -> [Int] {
    let count = Set(genres).count
    var album: [[Int]] = Array(repeating: [], count: count)
    
    for i in 0 ..< genres.count {
        album[getIndex(str: genres[i], count: count)].append(plays[i])
    }
//    album.sort { (a: [Int], b: [Int]) -> Bool in
//        return sum(arr: a) < sum(arr: b))
//    }
    album.sort(by: $0+$1)
    for i in 0 ..< count {
        print(album[i])
    }
    return []
}

let testInput = [["classic", "pop", "classic", "classic", "pop"]]
let testInput2 = [[500, 600, 150, 800, 2500]]
let testOutput = [[4, 1, 3, 0]]

for i in 0 ..< testInput.count {
    let output = solution(testInput[i], testInput2[i])
    if output == testOutput[i] {
        print("성공")
    } else {
        print("실패: \(testInput[i]) : \(output)")
    }
}


