//
//  main.swift
//  가사검색
//
//  Created by 강병우 on 2020/05/08.
//  Copyright © 2020 강병우. All rights reserved.
//

import Foundation

class TrieNode<T: Hashable> {
    var value: T?
    let parent: TrieNode?
    var childNodes: [T: TrieNode] = [:]
    var count: Int = 0
    var isTerminating = false
    
    init(value: T? = nil, parent: TrieNode? = nil) {
        self.value = value
        self.parent = parent
    }
    
    func add(value: T) {
        guard childNodes[value] == nil else {
            return
        }
        
        childNodes[value] = TrieNode(value: value, parent: self)
    }
}

class Trie {
    let root: TrieNode<Character>
    
    init() {
        self.root = TrieNode<Character>()
    }
    
    func insert(word: String) {
        guard !word.isEmpty else {
            return
        }
        
        var currentNode = root
        var currentIndex = 0
        
        let characters: [Character] = word.map{Character(extendedGraphemeClusterLiteral: $0)}
        
        while currentIndex < characters.count {
            let c = characters[currentIndex]
            if let childNode = currentNode.childNodes[c] {
                currentNode = childNode
            } else {
                currentNode.add(value: c)
                currentNode = currentNode.childNodes[c]!
            }
            currentNode.count += 1
            currentIndex += 1
        }
        
        if currentIndex == characters.count {
            currentNode.isTerminating = true
        }
    }
    
    func find(word: String) -> Int {
        guard !word.isEmpty else {
            return 0
        }
        
        var currentNode = root
        var currentIndex = 0
        
        let characters: [Character] = word.map{Character(extendedGraphemeClusterLiteral: $0)}
        
        while currentIndex < characters.count {
            let c = characters[currentIndex]
            guard let childNode = currentNode.childNodes[c] else {
                // 없을 경우 or ? 를 만난경우
                if c == Character("?") {
                    return currentNode.count
                } else {
                    break
                }
            }
            currentNode = childNode
            currentIndex += 1
        }
        
        if currentIndex == characters.count && currentNode.isTerminating {
            return 1
        } else {
            return 0
        }
    }
}

func solution(_ words:[String], _ queries:[String]) -> [Int] {
    var resultArray: [Int] = []
//    // Trie를 만들자
//    let trie: Trie = Trie()
//    let reversedTrie: Trie = Trie()
//
//    // Trie에 값 넣자
//    for word in words {
//        trie.insert(word: word)
//        reversedTrie.insert(word: String(word.reversed()))
//    }
//
//    for q in queries {
//        // 물음표 위치는 첫단어가 ? 이거나 마지막단어가 ? 2가지 경우
//        if q.last == Character("?") {
//            // 마지막이 물음표라 뒤집어서 검색해야함 -> 일반 Trie 에 검색
//            let count = trie.find(word: q)
//            resultArray.append(count)
//        } else {
//            // 처음이 물음표 -> 거꾸로된 Trie에 검색
//            let count = reversedTrie.find(word: String(q.reversed()))
//            resultArray.append(count)
//        }
//    }
    
    for i in 0 ..< queries.count {
        let q = queries[i]
        if q.last == Character("?") {
            let trie: Trie = Trie()
            for word in words {
                if word.count == q.count {
                    trie.insert(word: word)
                }
            }
            let count = trie.find(word: q)
            resultArray.append(count)
        } else {
            let reversedTrie: Trie = Trie()
            let reversedWord = String(q.reversed())
            for word in words {
                if word.count == q.count {
                    reversedTrie.insert(word: String(word.reversed()))
                }
            }
            let count = reversedTrie.find(word: reversedWord)
            resultArray.append(count)
        }
    }
    return resultArray
}

let testInput = [["frodo", "front", "frost", "frozen", "frame", "kakao"]]
let testInput2 = [["fro??", "????o", "fr???", "fro???", "pro?"]]
let testOutput = [[3, 2, 4, 1, 0]]

for i in 0 ..< testInput.count {
    let output = solution(testInput[i], testInput2[i])
    if output == testOutput[i] {
        print("성공")
    } else {
        print("실패: \(output)")
    }
}
