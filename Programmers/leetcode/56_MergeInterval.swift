//
//  MergeInterval.swift
//  Programmers
//
//  Created by 심영민 on 2021/10/23.
//

import Foundation

class MergeInterval {
    static func solution(_ intervals: [[Int]]) -> [[Int]] {
        let intervals = intervals.sorted(by: {$0[0] < $1[0]})
        var result: [[Int]] = []
        var current = 0
        
        while current < intervals.count {
            if current == intervals.count - 1 {
                result.append(intervals[current])
            }
            // overlap 된다면
            else if intervals[current+1][0] <= intervals[current][1] {
                
                result.append([min(intervals[current][0], intervals[current+1][0]),
                                   max(intervals[current][1], intervals[current+1][1])])
                current += 1
            } else {
                result.append(intervals[current])
            }
            current += 1
        }
        return result
    }
    
    static func solution2(_ intervals: [[Int]]) -> [[Int]] {
        let intervals = intervals.sorted{ $0[0] < $1[0] }
        var result = [intervals[0]]
        
        for i in 1..<intervals.count {
            let lastIndex = result.count - 1
            
            if intervals[i][0] <= result[lastIndex][1] {
                result[lastIndex] = [min(result[lastIndex][0], intervals[i][0]), max(result[lastIndex][1], intervals[i][1])]
            } else {
                result.append(intervals[i])
            }
        }
        return result
    }
}
