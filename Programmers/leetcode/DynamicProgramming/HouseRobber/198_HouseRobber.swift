//
//  198_HouseRobber.swift
//  Programmers
//
//  Created by 심영민 on 2021/09/02.
//

import Foundation

class HouseRobber {
    static func rob(_ nums: [Int]) -> Int {
        var nums = nums
        
        guard nums.count > 2 else {
            return nums.max()!
        }
        
        for i in 2..<nums.count {
            nums[i] += nums[0...(i-2)].max()!
        }
        return max(nums[nums.count-1], nums[nums.count-2])
    }
}
