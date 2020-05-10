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
            currentIndex += 1
        }
        
        if currentIndex == characters.count {
            currentNode.isTerminating = true
        }
    }
    
    func search(prefix: String, count: Int) -> [String] {
        var currentNode = root
        for value in prefix {
            guard let child = currentNode.childNodes[value] else {
                return []
            }
            currentNode = child
        }
        return search(prefix: prefix, node: currentNode, depth: prefix.count, count: count)
    }
    
    func search(prefix: String, node: TrieNode<Character>, depth: Int, count: Int) -> [String] {
        var result = [String]()
        
        if node.isTerminating && depth == count{
            result.append(prefix)
        }
        for child in node.childNodes.values {
            var prefix = prefix
            prefix.append(child.value!)
            result.append(contentsOf: search(prefix: prefix, node: child, depth: depth + 1, count: count))
        }
        return result
    }
}

func solution(_ words:[String], _ queries:[String]) -> [Int] {
    var resultArray: [Int] = []
//    // Trie를 만들자
    let trie: Trie = Trie()
    let reversedTrie: Trie = Trie()

    // Trie에 값 넣자
    for word in words {
        trie.insert(word: word)
        reversedTrie.insert(word: String(word.reversed()))
    }
    
    for q in queries {
        // 물음표 위치는 첫단어가 ? 이거나 마지막단어가 ? 2가지 경우
        if q.last == Character("?") {
            // 마지막이 물음표라 뒤집어서 검색해야함 -> 일반 Trie 에 검색
            let search = trie.search(prefix: q.trimmingCharacters(in: ["?"]), count: q.count)
            resultArray.append(search.count)
        } else {
            // 처음이 물음표 -> 거꾸로된 Trie에 검색
            let search = reversedTrie.search(prefix: String(q.trimmingCharacters(in: ["?"]).reversed()), count: q.count)
            resultArray.append(search.count)
        }
    }

    return resultArray
}
