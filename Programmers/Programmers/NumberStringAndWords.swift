//
//  NumberStringAndWords.swift
//  Programmers
//
//  Created by 심영민 on 2021/10/13.
//

import Foundation

class NumberStringAndWords {
    static func solution(_ s: String) -> Int {
        
        let string = s.filter{$0.isNumber}
        guard string.count != s.count else {
            return Int(string)!
        }
        let stringDictionary: [String:Int] = [
            "zero": 0,
            "one": 1,
            "two": 2,
            "three": 3,
            "four": 4,
            "five": 5,
            "six": 6,
            "seven": 7,
            "eight": 8,
            "nine": 9
        ]
        
        var result = [String]()
        let s = s.map{String($0)}
        var isApendded = false
        var current = 0
        
        while current < s.count {
            if String.Element(s[current]).isNumber {
                result.append(s[current])
                current += 1
            } else {
                for size in 2...4 {
                    for key in stringDictionary.keys {
                        if key == s[current...current+size].joined() {
                            current += size + 1
                            result.append(String(stringDictionary[key]!))
                            isApendded = true
                            break
                        }
                    }
                    if isApendded {
                        isApendded = false
                        break
                    }
                }
            }
        }
        return Int(result.joined())!
    }
}
