//
//  ParityDegree.swift
//  Programmers
//
//  Created by 심영민 on 2021/09/16.
//

import Foundation

class ParityDegree {
    static func solution(_ N : Int) -> Int {
        var num = 0
        var result = 0
        var count = 0
        
        while num <= N {
            num = Int(pow(2, Float(count)))
            if N % num == 0 {
                result = max(result, count)
            }
            count += 1
        }
        return result
    }
    
    static func solution2(_ N: Int) -> Int {
        let binary = String(N, radix: 2)
        var num = binary.count-1
    
        while num > 0 {
            if N % Int(pow(2, Double(num))) == 0 {
                return num
            }
            num -= 1
        }
        return 0
    }
}
