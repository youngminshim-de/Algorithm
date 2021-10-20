//
//  15_3Sum.swift
//  Programmers
//
//  Created by 심영민 on 2021/10/20.
//

import Foundation

class Triplets {
    static func solution(_ nums: [Int]) -> [[Int]] {
        guard nums.count > 2 else {
            return []
        }
        let nums = nums.sorted(by: <)
        var result: Set<[Int]> = []
        var index = 0
        var start = 0
        var end = 1
        
        while index < nums.count - 2 {
            start = index + 1
            end = nums.count - 1
            
            while start < end {
                let sum = nums[index] + nums[start] + nums[end]
                
                if sum == 0 {
                    result.insert([nums[index], nums[start], nums[end]])
                    start += 1
                } else if sum < 0 {
                    start += 1
                } else if sum > 0 {
                    end -= 1
                }
            }
            index += 1
        }
        return Array(result)
    }
}
