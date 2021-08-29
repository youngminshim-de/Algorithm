//
//  35_SearchInsertPosition.swift
//  Programmers
//
//  Created by 심영민 on 2021/08/29.
//

import Foundation

class SearchInsertPosition {
    static func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        var left = 0
        var right = nums.count - 1
        var mid = 0
        
        while left <= right {
            mid = (left + right) / 2
            
            if nums[mid] == target {
                return mid
            }
            
            if nums[mid] > target {
                right = mid - 1
            } else {
                left = mid + 1
            }
        }
        return nums[mid] > target ? mid : mid + 1
    }
}
