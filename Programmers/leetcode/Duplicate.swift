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
//        let result = numsCount.filter({ key, value in
//            value > 1
//        })
        return false
    }
}
