//
//  946_ValidateStackSequences.swift
//  Programmers
//
//  Created by 심영민 on 2021/08/12.
//

import Foundation

class ValidateStackSequences {
    static func validateStackSequences(_ pushed: [Int], _ popped: [Int]) -> Bool {
        
        var result = [Int]()
        var i = 0
        for num in pushed {
            result.append(num)
            
            while !result.isEmpty && result.last == popped[i] {
                result.removeLast()
                i += 1
            }
        }
        return result.count == 0 ? true : false
    }
}
