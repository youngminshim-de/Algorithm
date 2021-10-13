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
    
    static func solution2(_ s: String) -> Int {
        
        var result = ""
        var word = ""
        let stringDictionary: [String:String] = [
            "zero": "0",
            "one": "1",
            "two": "2",
            "three": "3",
            "four": "4",
            "five": "5",
            "six": "6",
            "seven": "7",
            "eight": "8",
            "nine": "9"
        ]
        // string은 기본적으로 subscript로 접근 불가능 -> 이에 String.Element로 접근했는데
        // indices를 사용하니까 접근이 가능하다.
        // String.Element 즉 (Character) type이 되므로 isNumber 함수 또한 호출 가능
        // 즉 indices를 사용하면 String <-> String.Element로 변환할 필요가 없다.
        for index in s.indices {
            if s[index].isNumber {
                result.append(s[index])
            } else {
                word.append(s[index])
                if stringDictionary[word] != nil {
                    result.append(stringDictionary[word]!)
                    word = ""
                }
            }
        }
        return Int(result)!
    }
    
    static func solution3(_ s: String) -> Int {
        var result = s
        result = result.replacingOccurrences(of: "zero", with: "0")
        result = result.replacingOccurrences(of: "one", with: "1")
        result = result.replacingOccurrences(of: "two", with: "2")
        result = result.replacingOccurrences(of: "three", with: "3")
        result = result.replacingOccurrences(of: "four", with: "4")
        result = result.replacingOccurrences(of: "five", with: "5")
        result = result.replacingOccurrences(of: "six", with: "6")
        result = result.replacingOccurrences(of: "seven", with: "7")
        result = result.replacingOccurrences(of: "eight", with: "8")
        result = result.replacingOccurrences(of: "nine", with: "9")
        return Int(result)!
    }
}
