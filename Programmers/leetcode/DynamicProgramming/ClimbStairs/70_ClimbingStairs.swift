//
//  ClimbingStairs.swift
//  Programmers
//
//  Created by 심영민 on 2021/09/01.
//

import Foundation

class ClimbingStairs {
    static func climbStairs(_ n: Int) -> Int {
        var result = 0
        
        func dfs(_ index: Int) {
            guard index != 0 else {
                result += 1
                return
            }
            guard index > 0 else {
                return
            }
            dfs(index-1)
            dfs(index-2)
        }
        
        dfs(n-1)
        dfs(n-2)
        return result
    }
    static var resultList = Array<Int>(repeating: 0, count: 46)
    static func climbStairs2(_ n: Int) -> Int {

        guard n > 3 else {
            return n
        }
        
        if resultList[n] > 0 {
            return resultList[n]
        } else {
            resultList[n] = climbStairs2(n-1) + climbStairs2(n-2)
            return resultList[n]
        }
    }
}
