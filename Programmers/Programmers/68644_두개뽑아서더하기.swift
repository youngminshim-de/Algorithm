//
//  68644_두개뽑아서더하기.swift
//  Programmers
//
//  Created by 심영민 on 2021/10/15.
//

import Foundation

class SumOfTwo {
    static func solution(_ numbers:[Int]) -> [Int] {
        var result = Set<Int>()
        var checkList = Array(repeating: false, count: numbers.count)
        
        func dfs(_ index: Int, _ count: Int, _ sum: Int) {
            guard count < 2 else {
                result.insert(sum)
                return
            }
            
            for i in index..<numbers.count {
                if !checkList[i] {
                    checkList[i] = true
                    dfs(i+1, count+1, sum+numbers[i])
                    checkList[i] = false
                }
            }
        }
        dfs(0, 0, 0)
        return Array(result).sorted(by: <)
    }
}
