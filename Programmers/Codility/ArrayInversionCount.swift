//
//  ArrayInversionCount.swift
//  Programmers
//
//  Created by 심영민 on 2021/09/21.
//

import Foundation

class ArrayInversionCount {
    static func solution(_ A: inout [Int]) -> Int {
        var count = 0
        print(mergeSort(A, &count))
        return count
    }
    
    static func mergeSort(_ array: [Int], _ count: inout Int) -> [Int] {
        if array.count <= 1 {
            return array
        }
        let center = array.count / 2
        let left = Array(array[0..<center])
        let right = Array(array[center..<array.count])
        
        print("left: \(left[0]), right: \(right[0]), center: \(center)")
        func merge(_ left: [Int], _ right: [Int]) -> [Int] {
            var left = left
            var right = right
            var result: [Int] = []
            
            while !left.isEmpty && !right.isEmpty {
                if left[0] <= right[0] {
                    result.append(left.removeFirst())
                } else {
                    count += 1
                    
                    result.append(right.removeFirst())
                }
            }
            if !left.isEmpty {
                result.append(contentsOf: left)
            }
            
            if !right.isEmpty {
                result.append(contentsOf: right)
            }
            return result
        }
        return merge(mergeSort(left, &count), mergeSort(right, &count))
    }
}
