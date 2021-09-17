//
//  BinaryGap.swift
//  Programmers
//
//  Created by 심영민 on 2021/09/16.
//

import Foundation

class BinaryGap {
    func solution(_ N: Int) -> Int {
        let n = String(N, radix: 2).map{String($0)}
        var count = 0
        var maximumCount = 0
        var isCount = false
        for i in 0..<n.count {
            if isCount && n[i] == "0" {
                count += 1
            } else if isCount && n[i] == "1" {
                maximumCount = max(maximumCount, count)
                count = 0
            } else if !isCount && n[i] == "1" {
                isCount = true
            }
        }
        return maximumCount
    }
}
