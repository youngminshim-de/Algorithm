//
//  FloodDepth.swift
//  Programmers
//
//  Created by 심영민 on 2021/09/15.
//

import Foundation

class FloodDepth {
    static func solution(_ A: inout [Int]) -> Int {
        
        var left = 0
        var right = A.count
        var depth = 0
        
        guard A.count > 2 else {
            return depth
        }
        
        for i in 1..<A.count-1 {
            left = A[left..<i].max()!
            right = A[i+1..<right].max()!
            
            if left > A[i] && right > A[i] {
                depth = max(depth, min(left, right) - A[i])
            }
            left = 0
            right = A.count
        }
        return depth
    }
    
    static func solution2(_ A: inout [Int]) -> Int {
        var left = 0
        var middle = 0
        var maximum = 0
        
        guard A.count > 2 else {
            return 0
        }
        
        for i in 1..<A.count {
            if A[i] > A[left] {
                maximum = max(maximum, A[left] - A[middle])
                left = i
                middle = left
            } else if A[i] > A[middle] {
                maximum = max(maximum, A[i] - A[middle])
            } else if A[i] < A[middle] {
                middle = i
            }
        }
        return maximum
    }
}
