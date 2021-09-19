//
//  FirstUnique.swift
//  Programmers
//
//  Created by 심영민 on 2021/09/18.
//

import Foundation

class FirstUnique {
    static func solution(_ A: inout [Int]) -> Int {
        let dict = A.reduce(into: [:]) { (counts, value) in
            counts[value, default: 0] += 1
        }

        for value in A {
            if dict[value] == 1 {
                return value
            }
        }
        
        return -1
    }
}
