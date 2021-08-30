//
//  RotateArray.swift
//  Programmers
//
//  Created by 심영민 on 2021/08/30.
//

import Foundation

class RotateArray {
    static func rotate(_ nums: inout [Int], _ k: Int) {
        // solution 1
        // O(n^2)
        for _ in 0..<k {
            nums.insert(nums.removeLast(), at: 0)
        }
        
        // solution 2
        // O(n)
        let k = k % nums.count
        nums = Array(nums[nums.count - k..<nums.count] + nums[0..<nums.count-k])
    }
}
