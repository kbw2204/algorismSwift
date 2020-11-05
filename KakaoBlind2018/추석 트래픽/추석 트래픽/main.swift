//
//  main.swift
//  추석 트래픽
//
//  Created by 강병우 on 2020/11/04.
//

import Foundation

func solution(_ lines:[String]) -> Int {
    var max = 1
    var log: [[Date]] = Array(repeating: [], count: lines.count)
    let df = DateFormatter()
    df.dateFormat = "yyyy-MM-dd HH:mm:ss.SSS"
    df.calendar = Calendar(identifier: .iso8601)
    df.timeZone = TimeZone(secondsFromGMT: 0)
    df.locale = Locale(identifier: "ko_kr")
    for (i, line) in lines.enumerated() {
        let ipt = line.split(separator: " ").map{String($0)}
        let during = Double(ipt[2][..<ipt[2].index(ipt[2].endIndex, offsetBy: -1)])!
        var date = df.date(from: "\(ipt[0]) \(ipt[1])")! // endTime
        log[i].append(date)
        date.addTimeInterval(0.001-during)
        log[i].append(date)
    }

    for i in 0 ..< log.count-1 {
        var ct = 1
        let a시작 = log[i][1]
        var a시작후1초 = log[i][1]
        a시작후1초.addTimeInterval(0.999) // 이게 1초 후임..
        for j in i+1 ..< log.count { // 불필요한부분 뺴기 위해 i+1부터 시작
            let b시작 = log[j][1]
            let b끝 = log[j][0]
            if (b시작 >= a시작 && b시작 < a시작후1초) || (b끝 >= a시작 && b끝 < a시작후1초) || (b시작 <= a시작 && b끝 >= a시작후1초) { ct += 1}
        }
        if max < ct { max = ct }
    }
    
    for i in 0 ..< log.count-1 {
        var ct = 1
        let a끝 = log[i][0]
        var a끝후1초 = log[i][0]
        a끝후1초.addTimeInterval(0.999)
        for j in i+1 ..< log.count { // 불필요한부분 뺴기 위해 i+1부터 시작
            let b시작 = log[j][1]
            let b끝 = log[j][0]
            if (b시작 >= a끝 && b시작 < a끝후1초) || (b끝 >= a끝 && b끝 < a끝후1초) || (b시작 <= a끝 && b끝 >= a끝후1초) { ct += 1 }
        }
        if max < ct { max = ct }
    }
    return max
}


let ipt = ["2016-09-15 01:00:07.000 2s","2016-09-15 01:00:04.001 2.0s"]
let rst = solution(ipt)
print(rst)

// 확인할 코드
import Foundation

struct Process: Equatable, Comparable {
    var num: Int
    var start: Double
    var end: Double
    var duration: Double

    init(_ s: String, _ n: Int) {
        self.num = n
        let ss = s.split(separator: " ")
        let format = DateFormatter()
        format.dateFormat = "yyyy-MM-dd HH:mm:ss.SSS"
        let ns = "\(ss[0]) \(ss[1])"
        let d = format.date(from: ns)!

        self.duration = Double(ss[2].replacingOccurrences(of: "s", with: ""))!
        self.end = d.timeIntervalSinceReferenceDate
        self.start = end - duration + 0.001
    }

    static func <(lhs: Process, rhs: Process) -> Bool {
        return lhs.start < rhs.start
    }

    static func == (lhs: Process, rhs: Process) -> Bool {
        return lhs.num == rhs.num
    }
}

func solution(_ lines:[String]) -> Int {
    var ps = lines.reduce(into: [Process](), { ary, s in
        ary.append(Process(s, ary.count))
    })
    ps.sort()

    var mx = 1

    var lastCheckRangeStart = ps[0].start - 3.1
    for i in 0..<ps.count-1 {
        let c = ps[i]
        var rangeStart = c.start;   // initial position of checking start position..
        while rangeStart <= c.end {
            if lastCheckRangeStart < rangeStart {       // if not checked this range
                lastCheckRangeStart = rangeStart        // update last check range position

                let rangeEnd = rangeStart + 1.0
                var cnt = 1
                for j in i+1..<ps.count {
                    let nxt = ps[j]
                    if rangeEnd < nxt.start{   // no need to check
                        break
                    }

                    if rangeStart...rangeEnd ~= nxt.start || rangeStart...rangeEnd ~= nxt.end
                        || nxt.start...nxt.end ~= rangeStart || nxt.start...nxt.end ~= rangeEnd {

                        cnt += 1
                    }
                }
                mx = max(mx, cnt)
            }

            rangeStart += 0.001
        }   // end of while statement
    }
    return mx
}
