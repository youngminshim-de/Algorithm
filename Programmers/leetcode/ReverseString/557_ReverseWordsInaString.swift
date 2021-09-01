//
//  557_ReverseWordsInaString.swift
//  Programmers
//
//  Created by 심영민 on 2021/09/01.
//

import Foundation

class ReverseWords {
    static func reverseWords(_ s: String) -> String {
        var str = s.components(separatedBy: " ").map{[Character]($0)}
        var result = ""
        for i in 0..<str.count {
            str[i] = str[i].reversed()
            // str = Character 배열
        }
        result = String(str.joined(separator: " "))

        return result
    }
    
    static func reverseWords2(_ s: String) -> String {
        var str = s.components(separatedBy: " ")
        for i in 0..<str.count {
            str[i] = String(str[i].reversed())
            // str = String 배열
        }

        return str.joined(separator: " ")
        // 한줄로 표현
//        return s.components(separatedBy: " ").map{String($0.reversed())}.joined(separator: " ")
    }
}
