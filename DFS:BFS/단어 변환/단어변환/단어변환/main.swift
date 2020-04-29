//
//  main.swift
//  단어변환
//
//  Created by 강병우 on 2020/04/28.
//  Copyright © 2020 강병우. All rights reserved.
//

// 깊이

import Foundation

func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {
    var min: Int = words.count
    
    dfs(target: target, after: begin, words: words, depth: 0, min: &min)
    
    return min == words.count ? 0 : min
}

func dfs(target: String, after: String, words: [String], depth: Int, min: inout Int){
    
    if after == target {
        if min > depth {
            min = depth
        }
    } else if words.count == 0 {
        return
    }
    
    for i in 0 ..< words.count {
        if check(word: words[i], after: after) {
            var varWords = words
            let afterWord = varWords.remove(at: i)
            dfs(target: target, after: afterWord, words: varWords, depth: depth + 1, min: &min)
        }
    }
}

func check(word: String, after: String) -> Bool {
    var count = 0
    for i in 0 ..< word.count {
        let wordIndex = word.index(word.startIndex, offsetBy: i)
        let afterIndex = after.index(after.startIndex, offsetBy: i)
        if word[wordIndex] != after[afterIndex] {
            count += 1
            if count >= 2 {
                return false
            }
        }
    }
    return count == 1 ? true : false
}



if solution("hit", "cog", ["hot", "dot", "dog", "lot", "log", "cog"]) == 4 {
    print("정답")
}


