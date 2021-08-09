//
//  MinimizeMaximumPair.swift
//  Programmers
//
//  Created by 심영민 on 2021/08/09.
//

import Foundation

class MinimizeMaximum {
    static func minPairSum(_ nums: [Int]) -> Int {
        var result = 0
        let sortedArray = nums.sorted(by: <)
        
        var first =  0
        var last = sortedArray.count - 1
        
        while first < last {
            result = max(sortedArray[first]+sortedArray[last], result)
            first += 1
            last -= 1
        }
        return result
    }
}
