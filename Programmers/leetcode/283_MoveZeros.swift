//
//  283_MoveZeros.swift
//  Programmers
//
//  Created by 심영민 on 2021/08/28.
//

import Foundation

class MoveZeroes {
    static func moveZeroes(_ nums:inout [Int]) {
        
        var current = 0
        var next = nums.count - 1
        
        while current <= next {
            if nums[current] == 0 {
                nums.remove(at: current)
                nums.append(0)
            } else {
                current += 1
            }
            if nums[next] == 0 {
                next -= 1
            }
        }
    }
    
    static func moveZeroes2(_ nums:inout [Int]) {
        let count = nums.count
        nums = nums.filter{ $0 != 0 }
        for _ in 0..<count - nums.count {
            nums.append(0)
        }
    }
}
