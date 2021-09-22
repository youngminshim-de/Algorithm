//
//  ArrayListLength.swift
//  Programmers
//
//  Created by 심영민 on 2021/09/22.
//

import Foundation

class ArrayListLength {
    static func solution(_ A: inout [Int]) -> Int {
        var count = 1
        var currentIndex = 0
        while A[currentIndex] != -1 {
            currentIndex = A[currentIndex]
            count += 1
        }
        
        return count
    }
}
