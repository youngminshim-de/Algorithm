//
//  46_Permutations.swift
//  Programmers
//
//  Created by 심영민 on 2021/08/20.
//

import Foundation

class Permutation {
    static func permute(_ nums: [Int]) -> [[Int]] {
        var result = [[Int]]()
        var checkList = Array<Int>(repeating: 0, count: nums.count)
        var array = [Int]()
        func dfs(_ currentCount: Int, _ targetCount: Int, _ array: inout [Int]) {
            if currentCount == targetCount {
                result.append(array)
            }
            
            for i in 0..<nums.count {
                if checkList[i] == 0 {
                    checkList[i] = 1
                    array.append(nums[i])
                    dfs(currentCount+1, targetCount, &array)
                    array.removeLast()
                    checkList[i] = 0
                }
            }
        }
        dfs(0, nums.count, &array)
        return result
    }
}

class Permutation2 {
    static func permuteUnique(_ nums: [Int]) -> [[Int]] {
        var result = Set<[Int]>()
        var checkList = Array<Int>(repeating: 0, count: nums.count)
        var array = [Int]()
        func dfs(_ currentCount: Int, _ targetCount: Int, _ array: inout [Int]) {
            if currentCount == targetCount {
                result.insert(array)
            }
            
            for i in 0..<nums.count {
                if checkList[i] == 0 {
                    checkList[i] = 1
                    array.append(nums[i])
                    dfs(currentCount+1, targetCount, &array)
                    array.removeLast()
                    checkList[i] = 0
                }
            }
        }
        dfs(0, nums.count, &array)
        return result.map({$0})
    }
}
