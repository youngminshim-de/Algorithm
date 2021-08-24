//
//  43165_TargetNumber.swift
//  Programmers
//
//  Created by 심영민 on 2021/08/24.
//

import Foundation

class TargetNumber {
    static func solution(_ numbers: [Int], _ target: Int) -> Int {
        var result = 0
        
        func dfs(_ index: Int, _ sum: Int) {
            if index == numbers.count - 1 {
                if sum == target {
                    result += 1
                }
                return
            }

            dfs(index + 1, sum + numbers[index+1])
            dfs(index + 1, sum - numbers[index+1])
        }
        
        dfs(0, numbers[0])
        dfs(0, -numbers[0])
        return result
    }
}
