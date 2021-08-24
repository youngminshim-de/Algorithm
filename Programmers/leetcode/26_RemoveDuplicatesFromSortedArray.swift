//
//  26_RemoveDuplicatesFromSortedArray.swift
//  Programmers
//
//  Created by 심영민 on 2021/08/24.
//

import Foundation

class RemoveDuplicatesFromSortedArray {
    static func removeDuplicates(_ nums: inout [Int]) -> Int {
        guard nums.count > 1 else {
            return nums.count
        }
        var current = 0
        var next = 1
        
        while next < nums.count {
            if nums[current] != nums[next] {
                // first의 바로 다음 원소와 Next를 swap해준다.
                nums.swapAt(current+1, next)
                current += 1
            }
            next += 1
        }
        // first의 현재위치가 마지막으로 원소를 바꾼 index
        // first index까지가 중복되지 않은 원소로 정렬되어있는 상태이고, 개수는 + 1
        return current + 1
    }
    
    static func removeDuplicates2(_ nums: inout [Int]) -> Int {
        guard nums.count > 1 else {
            return nums.count
        }
        
        var currentIndex = 1
        
        for index in 1..<nums.count {
            if nums[currentIndex-1] != nums[index] {
                nums[currentIndex] = nums[index]
                currentIndex += 1
            }
        }
        return currentIndex
    }
}
