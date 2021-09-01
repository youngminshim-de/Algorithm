//
//  746_MinCostClimbingStairs.swift
//  Programmers
//
//  Created by 심영민 on 2021/09/01.
//

import Foundation

class MinCostClimbingStairs {
    static func minCostClimbingStairs(_ cost: [Int]) -> Int {
        var cost = cost
        
        for i in 2..<cost.count - 1 {
            cost[i] += min(cost[i-1], cost[i-2])
        }
        return min(cost[cost.count-1], cost[cost.count-2])
    }
}
