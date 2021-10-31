//
//  1629_곱셈.swift
//  Programmers
//
//  Created by 심영민 on 2021/10/31.
//

import Foundation

class multiplication {
    static func solution() {
        let numbers = readLine()!.components(separatedBy: " ").map{Int($0)!}
        
        func pow(_ a: Int, _ b: Int, _ c: Int) -> Int {
            if b == 1 {
                return (a % c)
            }
            var val = pow(a, (b / 2), c)
            val = val * val % c
            if b % 2 == 0 {
                return val
            }
            return val * a % c
        }
        
        print(pow(numbers[0], numbers[1], numbers[2]))
    }
}
