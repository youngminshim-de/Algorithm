//
//  CombinationSum.swift
//  Programmers
//
//  Created by 심영민 on 2021/10/21.
//

import Foundation

class CombinationSum {
    static func soliution(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var result: [[Int]] = []
        var array: [Int] = []
        let candidates = candidates.sorted(by: <).filter{ $0 <= target }
        
        guard candidates.count != 0 else {
            return []
        }
        
        func dfs(_ array: inout [Int], _ sum: Int, _ index: Int) {
            guard sum != 0 else {
                result.append(array)
                return
            }
            guard sum >= candidates[0] else {
                return
            }
            
            for i in index..<candidates.count {
                array.append(candidates[i])
                dfs(&array, sum - candidates[i], i)
                array.removeLast()
            }
        }
        
        dfs(&array, target, 0)
        
        return result
    }
}
