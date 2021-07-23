//
//  42842_Carpet.swift
//  Programmers
//
//  Created by 심영민 on 2021/07/23.
//

import Foundation

class Carpet {
    static func solution(_ brown: Int, _ yellow: Int) -> [Int] {
        let total = brown + yellow
        var divisor = [Int]()
        
        for i in 3..<total {
            if total % i == 0 && 2 * i != total{
                divisor.append(i)
            }
        }
        
        divisor = divisor.sorted(by: >)
        while !divisor.isEmpty {
            if divisor.count == 1 {
                return [divisor[0], divisor[0]]
            }
            
            let first = divisor.removeFirst()
            let last = divisor.removeLast()
            
            if first*2 + ((last-2)*2) == brown {
                return [first,last]
            }
        }
        return []
    }
}
