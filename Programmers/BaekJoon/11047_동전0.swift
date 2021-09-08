//
//  11047_동전0.swift
//  Programmers
//
//  Created by 심영민 on 2021/09/08.
//

import Foundation

class Coin0 {
    static func solution() {
        let input = readLine()!.components(separatedBy: " ").map{Int($0)!}
        let count = input[0]
        var totalPrice = input[1]
        var coins = Array(repeating: 0, count: count)
        var result = 0
        
        for i in 0..<count {
            coins[i] = Int(readLine()!)!
        }
        
        for value in coins.reversed() {
            if value <= totalPrice {
                result += totalPrice / value
                totalPrice = totalPrice % value
            }
            
            if totalPrice == 0 {
                break
            }
        }
        print(result)
    }
}
