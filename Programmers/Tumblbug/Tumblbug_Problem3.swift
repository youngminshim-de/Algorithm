//
//  Tumblbug_Problem3.swift
//  Programmers
//
//  Created by 심영민 on 2021/11/03.
//

import Foundation

class Tumblbug_Problem3 {
    static func solution(_ n: Int) -> Int {
        var result = 0
        var multiplicationOfFive = 1
        
        while multiplicationOfFive < n {
            multiplicationOfFive *= 5
            result += n / multiplicationOfFive
        }
        
        return result
    }
}
