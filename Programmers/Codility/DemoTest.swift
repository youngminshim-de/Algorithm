//
//  DemoTest.swift
//  Programmers
//
//  Created by 심영민 on 2021/09/15.
//

import Foundation

class DemoTest {
    static func solution(_ A: inout [Int]) -> Int {
        let a = Set(A.filter{ $0 > 0 })
        var result = 1
        
        for num in a.sorted(by: <) {
            if result == num {
                result += 1
            } else {
                return result
            }
        }
        return result
    }
}
