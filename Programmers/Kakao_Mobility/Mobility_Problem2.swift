//
//  Mobility_Problem2.swift
//  Programmers
//
//  Created by 심영민 on 2021/10/29.
//

import Foundation

class Mobility_Problem2 {
    static func solution(_ A: inout [Int]) -> Int {
        var numberOfRoom = 0
        var index = 0
        A.sort(by: <)
        
        while index < A.count {
            index += A[index]
            numberOfRoom += 1
        }
        
        return numberOfRoom
    }
}
