//
//  MR_Problem2.swift
//  Programmers
//
//  Created by 심영민 on 2021/09/26.
//

import Foundation

class MR_Problem2 {
    static func solution(_ array: [Int], _ target: Int) -> String {
        var sortedArray = Array(repeating: Array(repeating: 0, count: 2), count: array.count)
        let a = readLine()!
        var tt = a.split(separator: " ")
        var left = 0
        var qqq = ""
        var test = qqq.split(separator: " ").map{Int($0)!}
        var right = sortedArray.count - 1
        
        for i in 0..<array.count {
            sortedArray[i] = [i, array[i]]
        }
        
        sortedArray = sortedArray.sorted(by: {$0[1] < $1[1]})
        
        
        while left < right {
            if sortedArray[left][1] + sortedArray[right][1] == target {
                return "\(sortedArray[left][0]),\(sortedArray[right][0])"
            } else if sortedArray[left][1] + sortedArray[right][1] < target {
                left += 1
            } else if sortedArray[left][1] + sortedArray[right][1] > target {
                right -= 1
            }
        }
        
        return ""
    }
}
