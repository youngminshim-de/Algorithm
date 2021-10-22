//
//  48_RotateImage.swift
//  Programmers
//
//  Created by 심영민 on 2021/10/22.
//

import Foundation

class JumpGame {
    static func solution(_ nums: [Int]) -> Bool {
        
        var maxIndex = nums[0]
        
        for (index, val) in nums.enumerated() {
            
            // 현재 갈수있는 칸수 = maxIndex
            // index 가야하는 칸수 = index
            // 갈수있는 칸 수 보다 가야하는 칸수가 더 크면 false
            if index > maxIndex {
                return false
            }
            
            maxIndex = max(maxIndex, index+val)
        }
        
        return true
    }
}
