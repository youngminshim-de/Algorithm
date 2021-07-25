//
//  42862_Uniform.swift
//  Programmers
//
//  Created by 심영민 on 2021/07/25.
//

import Foundation

class Uniform {
    static func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
        var student = Array(repeating: 1, count: n)
        var count = 0
        for i in lost {
            student[i-1] -= 1
        }
        
        for j in reserve {
            student[j-1] += 1
        }
        
        for i in 0..<n {
            if student[i] == 0 {
                if i > 0 && student[i-1] > 1 {
                    student[i] += 1
                    student[i-1] -= 1
                } else if i < n-1 && student[i+1] > 1 {
                    student[i] += 1
                    student[i+1] -= 1
                } else {
                    count += 1
                }
            }
        }
        return n - count
    }
}
