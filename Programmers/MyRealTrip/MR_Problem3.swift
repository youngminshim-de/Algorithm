//
//  MR_Problem3.swift
//  Programmers
//
//  Created by 심영민 on 2021/09/26.
//

import Foundation

class MR_Problem3 {
    static func solution(_ array: [[Int]]) -> String {
        var intervalSet = Set<Int>()
        var result = [String]()
        
        for i in 0..<array.count {
            for j in array[i][0]...array[i][1] {
                intervalSet.insert(j)
            }
        }
        var sortedSet = intervalSet.sorted(by: <)
        
        var firstValue = sortedSet[0]
        var lastValue = 0
        var count = 1
        
        for index in 1..<sortedSet.count {
            lastValue = sortedSet[index]
            if sortedSet[index] - firstValue == count {
                count += 1
                continue
            } else {
                result.append("[\(firstValue)-\(sortedSet[index])]")
                count = 1
            }
        }
        
        return result.joined(separator: ",")
    }
}
