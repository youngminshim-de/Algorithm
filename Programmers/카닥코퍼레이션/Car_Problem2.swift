//
//  Car_Problem2.swift
//  Programmers
//
//  Created by 심영민 on 2021/10/28.
//

import Foundation

class Car_Problem2 {
    static func solution(_ n: Int) -> Int {

        // 1자릿수 9 9 * 1
        // 2자릿수 180 90 * 2
        
        var figure = 1
        var multiplier = 9
        var maxNum = 9
        var sum = figure * multiplier
        
        while sum < n {
            multiplier *= 10
            figure += 1
            maxNum = (maxNum * 10) + 9
            sum += multiplier * figure
        }
        
        var num = maxNum - (sum - n) / figure
        for _ in 0..<((sum - n) % figure) {
            num /= 10
        }
        
        return num % 10
    }
}
