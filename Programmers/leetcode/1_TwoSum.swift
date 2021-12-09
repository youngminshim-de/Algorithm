//
//  TwoSum.swift
//  Programmers
//
//  Created by 심영민 on 2021/07/05.
//

import Foundation

class TwoSum {
    // O(n^2)
    static func solution(_ nums: [Int], _ target: Int) -> [Int] {
        var answer: [Int] = []
        for i in 0..<nums.count-1 {
            for j in i+1..<nums.count {
                if nums[i] + nums[j] == target {
                    answer.append(j)
                    answer.append(i)
                    break
                }
            }
        }
        return answer
    }
    
    // O(nlogn)
    static func solution3(_ nums: [Int], _ target: Int) -> [Int] {
        let sortedNums = nums.sorted(by: <)
        var left = 0
        var right = sortedNums.count - 1
        var result: [Int] = []

        while left < right {
            if sortedNums[left] + sortedNums[right] == target {
                if sortedNums[left] == sortedNums[right] {
                    result.append(nums.firstIndex(of: sortedNums[left])!)
                    result.append(nums.lastIndex(of: sortedNums[right])!)
                } else {
                    result.append(nums.firstIndex(of: sortedNums[left])!)
                    result.append(nums.firstIndex(of: sortedNums[right])!)
                }
                return result
            } else if sortedNums[left] + sortedNums[right] < target {
                left += 1
            } else {
                right -= 1
            }
        }
        return []
    }
    
    // O(n)
    static func solution1(_ nums: [Int], _ target: Int) -> [Int] {
        // key: value, value: Index
        var dict: [Int: Int] = [:]
        for i in 0..<nums.count {
            let differnce = target - nums[i]
            if let key = dict[differnce] {
                return [i, key]
            }
            dict[nums[i]] = i
        }
        return [Int]()
    }
}
