//
//  167_TwoSumPart2.swift
//  Programmers
//
//  Created by 심영민 on 2021/08/31.
//

import Foundation

class TwoSumPart2 {
    static func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        
        guard numbers.count > 2 else {
            return [1,2]
        }
        var current = 0
        var next = numbers.count - 1
        
        while current <= next {
            if numbers[current] + numbers[next] == target {
                return [current+1, next+1]
            } else if numbers[current] + numbers[next] > target {
                next -= 1
            } else {
                current += 1
            }
        }
        return []
    }
}
