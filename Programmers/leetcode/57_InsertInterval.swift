//
//  57_InsertIntervals.swift
//  Programmers
//
//  Created by 심영민 on 2021/10/25.
//

import Foundation

class InsertInterval {
    static func solution(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {

        var intervals = intervals
        intervals.append(newInterval)
        intervals = intervals.sorted(by: { $0[0] < $1[0] })
        var result = [intervals[0]]
        
        for i in 1..<intervals.count {
            let lastIndex = result.count
            
            if result[lastIndex-1][1] >= intervals[i][0] {
                result[lastIndex-1] = [min(result[lastIndex-1][0], intervals[i][0]), max(result[lastIndex-1][1], intervals[i][1])]
            } else {
                result.append(intervals[i])
            }
        }
        return result
    }
}
