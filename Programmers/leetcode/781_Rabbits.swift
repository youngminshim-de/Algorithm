//
//  781_Rabbits.swift
//  Programmers
//
//  Created by 심영민 on 2021/08/25.
//

import Foundation

class Rabbits {
    static func solution(_ answers: [Int]) -> Int {
        var result = 0
        
        let rabbitsCount = answers.reduce(into: [:]) { counts, rabbit in
            counts[rabbit, default: 0] += 1
        }
        
        for (key, value) in rabbitsCount {
            let quotient = value / (key + 1)
            let remainder = value % (key + 1)
            
            if quotient != 0 && remainder == 0 {
                result += quotient * (key + 1)
            } else {
                result += (quotient + 1) * (key + 1)
            }
        }
        
        return result
    }
}

