//
//  Duplicate.swift
//  Programmers
//
//  Created by 심영민 on 2021/07/08.
//

import Foundation

class Duplicate {
    static func containDuplicate(_ nums: [Int]) -> Bool {
        let numsDictionary = nums.reduce(into: [:]) { counts, num in
            counts[num, default: 0] += 1
        }
        for (_, value) in numsDictionary {
            if value > 1 {
                return true
            }
        }

        return false
    }
    
    static func containDuplicate2(_ nums: [Int]) -> Bool {
        let numSet = Set(nums)
        if numSet.count == nums.count {
            return false
        }
        return true
    }
}
