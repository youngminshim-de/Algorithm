//
//  1137_TribonacciNumber.swift
//  Programmers
//
//  Created by 심영민 on 2021/08/31.
//

import Foundation

class TribonacciNumber {
    static func tribonacci(_ n: Int) -> Int {
        guard n > 1 else {
            return n
        }
        guard n != 2 else {
            return 1
        }
        
        var result = Array(repeating: 0, count: n+1)
        result[0] = 0
        result[1] = 1
        result[2] = 1
        
        for i in 3...n {
            result[i] = result[i-1] + result[i-2] + result[i-3]
        }
        
        return result[n]
    }
    static var result2 = Array(repeating: 0, count: 38)
    
    static func tribonacci2(_ n: Int) -> Int {
        guard n > 1 else {
            return n
        }
        guard n != 2 else {
            return 1
        }
        if result2[n] > 0 {
            return result2[n]
        } else {
            result2[n] = tribonacci2(n-1) + tribonacci2(n-2) + tribonacci2(n-3)
            return result2[n]
        }
    }
}
