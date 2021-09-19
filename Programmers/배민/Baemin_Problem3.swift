//
//  Baemin_Problem3.swift
//  Programmers
//
//  Created by 심영민 on 2021/09/18.
//

import Foundation

class Baemin3 {
    static func solution(_ A: inout [Int]) -> Int {
        
        A.sort()
        for value in A.reversed() {
            if A.contains((-value)) {
                return value
            }
        }
        return 0
    }
    
    static func solution2(_ A: inout [Int]) -> Int {
        A.sort()
        
        for value in A.reversed() {
            let target = (-value)
            if binarySearch(A, target) {
                return value
            }
        }
        return 0
    }
    
    static func binarySearch(_ A: [Int], _ target: Int) -> Bool {
        var left = 0
        var right = A.count - 1
        while left <= right {
            let mid = (left + right) / 2
            if A[mid] == target {
                return true
            } else if A[mid] > target {
                right = mid - 1
            } else if A[mid] < target {
                left = mid + 1
            }
        }
        return false
    }
    // 제출한 코드
    static func solution3(_ A: inout [Int]) -> Int {
        A.sort()
        var start = 0
        var end = A.count - 1
        
        while start < end {
            if A[start] + A[end] == 0 {
                return A[end]
            } else if A[start] + A[end] > 0 {
                end -= 1
            } else {
                start += 1
            }
        }
        return 0
    }
}
