//
//  76501_NegatvieAndPositiveSum.swift
//  Programmers
//
//  Created by 심영민 on 2021/07/16.
//

import Foundation

class NAndPSum {
    static func solution(_ absolutes:[Int], _ signs:[Bool]) -> Int {
        
        var sum = 0
        
        for i in 0..<absolutes.count {
            sum += signs[i] == true ? +absolutes[i] : -absolutes[i]
        }
        return sum
    }
}
