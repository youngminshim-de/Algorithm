//
//  1051_HeightChecker.swift
//  Programmers
//
//  Created by 심영민 on 2021/08/23.
//

import Foundation

class HeightChecker {
    static func hegihtChecker(_ heights: [Int]) -> Int {
        
        let sortedArray = heights.sorted(by: <)
        var mismatchingCount = 0
        
        for i in 0..<heights.count {
            if sortedArray[i] != heights[i] {
                mismatchingCount += 1
            }
        }
        
        return mismatchingCount
    }
    
    static func heightChecker2(_ heights: [Int]) -> Int {
        
        return heights.sorted().enumerated().reduce(0) {
            $0 + ($1.element != heights[$1.offset] ? 1 : 0)
        }
    }
}
