//
//  84521_VowelDictionary.swift
//  Programmers
//
//  Created by 심영민 on 2021/10/05.
//

import Foundation

class VowelDictionary {
    static func solution(_ word: String) -> Int {
        let word = word.map{String($0)}
        var result = 0
        var multiplier = Int(pow(Double(5),Double(4)))
        let multiplierArray = [625, 125, 25, 5, 1]
        let dict = [
                    "A" : 1,
                    "E" : 2,
                    "I" : 3,
                    "O" : 4,
                    "U" : 5
        ]
        
        for char in word {
            if char == "A" {
                result += 1
            } else {
                var temp = multiplier
                
                while temp > 1 {
                    result += temp * (dict[char]! - 1)
                    temp /= 5
                }
                result += dict[char]!
            }
            multiplier /= 5
        }
        return result
    }
    
    static func solution2(_ word: String) -> Int {
        let word = word.map{String($0)}
        var result = 0
        let multiplierArray = [625, 125, 25, 5, 1]
        let dict = [
                    "A" : 1,
                    "E" : 2,
                    "I" : 3,
                    "O" : 4,
                    "U" : 5
        ]
        
        for i in 0..<word.count{
            if word[i] == "A" {
                result += 1
            } else {
                for j in i..<multiplierArray.count {
                    result += multiplierArray[j] * (dict[word[i]]! - 1)
                }
                result += 1
            }
        }
        return result
    }
}
