//
//  main.swift
//  전화번호목록
//
//  Created by 강병우 on 2020/07/08.
//  Copyright © 2020 강병우. All rights reserved.
//

import Foundation

class TrieNode {
    var value: Character?
    let parent: TrieNode?
    var childNodes: [Character:TrieNode] = [:]
    var isTerminating: Bool = false
    
    init(_ value: Character? = nil, _ parent: TrieNode? = nil) {
        self.value = value
        self.parent = parent
    }
    
    func add(_ value: Character) {
        guard childNodes[value] == nil else { return }
        childNodes[value] = TrieNode(value, self)
    }
}

class Trie {
    var root: TrieNode
    
    init() {
        self.root = TrieNode()
    }
    
    func insert(_ word: String) {
        guard !word.isEmpty else { return }
        
        var currentNode = root
        var currentIndex = 0
        let count = word.count
        
        let chars: [Character] = word.map{Character(extendedGraphemeClusterLiteral: $0)}
        
        while currentIndex < count {
            let c = chars[currentIndex]
            // 값이 있으면
            if let childNode = currentNode.childNodes[c] {
                currentNode = childNode
            } else {
                currentNode.add(c)
                if let childNode = currentNode.childNodes[c] {
                    currentNode = childNode
                }
            }
            currentIndex += 1
        }
        
        if currentIndex == count {
            currentNode.isTerminating = true
        }
    }
    
    func check(_ word: String) -> Bool {
        guard !word.isEmpty else { return false }
        
        var currentNode = root
        var currentIdx = 0
        let count = word.count
        
        let chars: [Character] = word.map{Character(extendedGraphemeClusterLiteral: $0)}
        
        while currentIdx < count, let childNode = currentNode.childNodes[chars[currentIdx]] {
            currentNode = childNode
            currentIdx += 1
        }
        
        if currentIdx == count && currentNode.isTerminating  {
            if currentNode.childNodes.count > 0 {
                return false
            } else {
                return true
            }
        }
        return false
    }
}

let n = Int(readLine()!)!
for _ in 0 ..< n {
    let trie: Trie = Trie()
    var arr: [String] = []
    let m = Int(readLine()!)!
    for _ in 0 ..< m {
        let ipt = readLine()!
        arr.append(ipt)
//        trie.insert(ipt)
    }
    arr = arr.sorted(by: {Int($0)! < Int($1)!})
    trie.insert(arr.first!)
    for i in 1 ..< m {
        trie.insert(arr[i])
        if !trie.check(arr[i-1]) {
            print("NO")
            break
        } else if i == m - 1 {
            print("YES")
        }
    }
}
