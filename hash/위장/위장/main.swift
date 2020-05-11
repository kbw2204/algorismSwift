//
//  main.swift
//  위장
//
//  Created by 강병우 on 2020/05/10.
//  Copyright © 2020 강병우. All rights reserved.
//

import Foundation

func solution(_ clothes:[[String]]) -> Int {
    
    
    return 0
}

struct HashTable<Key: Hashable, Value> {
    typealias Element = (key: Key, value: Value)
    typealias Bucket = [Element]
    var buckets: [Bucket]
    var count = 0 // ?
    var isEmpty: Bool {
        return count == 0
    }
    
    init(capacity: Int) {
        buckets = Array<Bucket>(repeating: [], count: capacity)
    }
    
    func index(forKey key: Key) -> Int {
        return abs(key.hashValue % buckets.count)
    }
    
    func value(forKey key: Key) -> Value? {
        let index = self.index(forKey: key)
        for element in buckets[index] {
            if element.key == key {
                return element.value
            }
        }
        return nil // hashTable에 없음
    }
    
    public subscript(key: Key) -> Value? {
        get {
            return value(forKey: key)
        }
        set {
            if let value = newValue {
                updateValue(value, forKey: key)
            } else {
                removeValue(forKey: key)
            }
        }
    }
    
    @discardableResult public mutating func updateValue(_ value: Value, forKey key: Key) -> Value? {
        let index = self.index(forKey: key)

        // Do we already have this key in the bucket?
        for (i, element) in buckets[index].enumerated() {
            if element.key == key {
                let oldValue = element.value
                buckets[index][i].value = value
                return oldValue
            }
        }

        // This key isn't in the bucket yet; add it to the chain.
        buckets[index].append((key: key, value: value))
        count += 1
        return nil
    }

    /**
     Removes the given key and its
     associated value from the hash table.
     */
    @discardableResult public mutating func removeValue(forKey key: Key) -> Value? {
        let index = self.index(forKey: key)

        // Find the element in the bucket's chain and remove it.
        for (i, element) in buckets[index].enumerated() {
            if element.key == key {
                buckets[index].remove(at: i)
                count -= 1
                return element.value
            }
        }
        return nil  // key not in hash table
    }
}

//let testInput = [[["yellow_hat", "headgear"], ["blue_sunglasses", "eyewear"], ["green_turban", "headgear"]]]
//let testOutput = [5]
//
//for i in 0 ..< testInput.count {
//    let output = solution(testInput[i])
//    if output == testOutput[i] {
//        print("성공")
//    } else {
//        print("실패: \(testInput[i]) : \(output)")
//    }
//}

var hashTable: HashTable = HashTable<String, String>(capacity: 5)

hashTable["head"] = "test1"
hashTable["head"] = "test2"
hashTable["mid"] = "mid1"

print(hashTable["head"])


extension HashTable: CustomStringConvertible {
    /// A string that represents the contents of the hash table.
    public var description: String {
        let pairs = buckets.flatMap { b in b.map { e in "\(e.key) = \(e.value)" } }
        return pairs.joined(separator: ", ")
    }
    
    /// A string that represents the contents of
    /// the hash table, suitable for debugging.
    public var debugDescription: String {
        var str = ""
        for (i, bucket) in buckets.enumerated() {
            let pairs = bucket.map { e in "\(e.key) = \(e.value)" }
            str += "bucket \(i): " + pairs.joined(separator: ", ") + "\n"
        }
        return str
    }
}
