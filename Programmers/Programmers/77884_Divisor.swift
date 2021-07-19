//
//  77884_Divisor.swift
//  Programmers
//
//  Created by 심영민 on 2021/07/16.
//

import Foundation

class Divisor {
    static func solution(_ left:Int, _ right:Int) -> Int {
        
        var count = 0
        var result: [Int] = []
        
        for i in left...right {
            for j in 1...i {
                if i % j == 0 {
                    count += 1
                }
            }
            if count % 2 == 0 {
                result.append(i)
            } else {
                result.append(-i)
            }
            count = 0
        }
        
        return result.reduce(0, +)
    }
}
