//
//  MR_Problem1.swift
//  Programmers
//
//  Created by 심영민 on 2021/09/26.
//

import Foundation

class MR_Problem1 {
    static func solution(_ str: String) -> Bool {
        var stack: [String.Element] = []
        var isValid = true
        
        for char in str {
            switch char {
            case "(", "[", "{":
                stack.append(char)
            case ")":
                if stack.last != "(" {
                    isValid = false
                } else {
                    stack.removeLast()
                }
            case "]":
                if stack.last != "[" {
                    isValid = false
                } else {
                    stack.removeLast()
                }
            case "}":
                if stack.last != "{" {
                    isValid = false
                } else {
                    stack.removeLast()
                }
            default:
                break
            }
        }
        if !stack.isEmpty {
            isValid = false
        }
        
        return isValid
    }
}
