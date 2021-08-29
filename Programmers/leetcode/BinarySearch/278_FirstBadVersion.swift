//
//  278_FirstBadVersion.swift
//  Programmers
//
//  Created by 심영민 on 2021/08/29.
//

import Foundation

class FirstBadVersion {
    static func isBadVersion(_ version: Int) -> Bool {
        return true
    }
    
    static func firstBadVersion(_ n: Int) -> Int {
        var left = 0
        var right = n
        var mid = 0
        while left <= right {
            mid = (left + right) / 2
            
            if isBadVersion(mid) == true && isBadVersion(mid-1) == false {
                return mid
            }
            
            if !isBadVersion(mid) {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        return 0
    }
    
    static func firstBadVersion2(_ n: Int) -> Int {
        for i in 1...n {
            if isBadVersion(i) {
                if !isBadVersion(i-1) {
                    return i
                }
            }
        }
        return 0
    }
}
