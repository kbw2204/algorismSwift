//
//  main.swift
//  방금그곡
//
//  Created by 강병우 on 2020/11/01.
//

import Foundation

func solution(_ m:String, _ musicinfos:[String]) -> String {
    var musicTitle = ""
    var maxTime = 0
    let 시간차이: (String, String) -> Int = { stt, edt in
        let df = DateFormatter()
        df.dateFormat = "HH:mm"
        
        return Int(df.date(from: edt)!.timeIntervalSince(df.date(from: stt)!)/60)
    }
    
    let 샵구분: (String) -> String = {
        var pos = 0
        let sing = $0.map{String($0)}
        var rst = ""
        while pos < sing.count {
            if pos+1 != sing.count && sing[pos+1] == "#" {
                rst += sing[pos].lowercased()
                pos += 1
            } else {
                rst += sing[pos]
            }
            pos += 1
        }
        return rst
    }
    
    let m = 샵구분(m)
    for info in musicinfos {
        let con = info.split(separator: ",").map{String($0)}
        let stt = con[0]
        let ent = con[1]
        let title = con[2]
        let sing = 샵구분(con[3]).map{String($0)}
        let time = 시간차이(stt,ent)
        var melody = ""
       
        for i in 0 ..< time {
            melody += sing[i%sing.count]
        }
        if melody.contains(m) {
            if maxTime != 0 {
                if maxTime < time {
                    musicTitle = title
                    maxTime = time
                }
            } else {
                musicTitle = title
                maxTime = time
            }
        }
    }
    
    return musicTitle != "" ? musicTitle : "(None)"
}
let a = ["00:00,00:05,HI,ABC#ABC"]
print(solution("ABC", a))

