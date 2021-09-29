//
//  CountBoundedSlice.swift
//  Programmers
//
//  Created by 심영민 on 2021/09/24.
//

import Foundation

class CountBoundedSlice {
    // O(N^2)
    static func solution(_ K: Int, _ A: inout [Int]) -> Int {
        var result = 0
        
        var difference = 0
        var minimum = 0
        var maximum = 0
        for i in 0..<A.count {
             minimum = A[i]
             maximum = A[i]
            for j in i..<A.count {
                minimum = min(minimum, A[j])
                maximum = max(maximum, A[j])
                difference = maximum - minimum
                
                if difference <= K {
                    print("(\(i), \(j))")
                    result += 1
                } else {
                    break
                }
            }
        }
        return result
    }
    
    static func solution2(_ K: Int, _ A: inout [Int]) -> Int {
        var result = 0
        var current = 0
        var next = current
        var minimum = A[current]
        var maximum = A[current]
        
        while current < A.count {
            if current == next {
                maximum = A[current]
                minimum = A[current]
            }
            
            if next == A.count {
                current += 1
                next = current
                continue
            }

            if abs(minimum - A[next]) > K || abs(maximum - A[next]) > K{
                current += 1
                next = current
            } else {
                result += 1
                maximum = max(maximum, A[next])
                minimum = min(minimum, A[next])
                next += 1
            }
        }
        
        return result
    }
}
