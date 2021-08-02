//
//  42883_MakeBigNumber.swift
//  Programmers
//
//  Created by 심영민 on 2021/08/02.
//

import Foundation

class BigNumber {
    static func solution(_ number: String, _ k: Int) -> String {
        var numbers = number.map{$0}
        var maximum = 0
        var count = 0
        while k > count {
            for i in 0..<numbers.count-1 {
                if numbers[i] < numbers[i+1] {
                    numbers.remove(at: i)
                    count += 1
                    break
                }
            }
        }
        if count == 0 {
            for _ in 0..<k {
                numbers.removeLast()
            }
        }
        let result = numbers.reduce("") {$0+String($1)}
        return result
    }
}
