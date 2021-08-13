//
//  20_ValidParentheses.swift
//  Programmers
//
//  Created by 심영민 on 2021/08/13.
//

import Foundation

class ValidParentheses {
    static func isValid(_ s: String) -> Bool {
        var str = s
        
        while true{
            str = str.replacingOccurrences(of: "()", with: "")
            str = str.replacingOccurrences(of: "[]", with: "")
            str = str.replacingOccurrences(of: "{}", with: "")
            if str.isEmpty {
                return true
            }
            if !str.contains("()") && !str.contains("[]") && !str.contains("{}") {
                return false
            }
        }
    }
    
    static func isValid2(_ s: String) -> Bool {
        var bracket: [Character] = []
        
        for str in s {
            if str == "(" || str == "{" || str == "[" {
                bracket.insert(str, at: 0)
                continue
            } else if (str == ")" && bracket.first != "(") ||
                        (str == "}" && bracket.first != "{") ||
                        (str == "]" && bracket.first != "[") {
                return false
            }
            bracket.removeFirst()
        }
        return bracket.isEmpty
    }
}
