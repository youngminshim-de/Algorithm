//
//  Tumblbug_Problem2.swift
//  Programmers
//
//  Created by 심영민 on 2021/11/03.
//

import Foundation

class Tumblbug_Problem2 {
    static func solution(_ num: Int) -> Int {
        var numArray: [Int] = []
        var quotient = num
        
        while quotient > 0 {
            numArray.insert(quotient % 10, at: 0)
            quotient /= 10
        }
        
        if numArray.count % 2 != 0 {
            numArray.append(0)
        }
        
        var target = 1
        for i in 0..<(numArray.count/2) {
            target *= numArray[i]
        }
        
        var backNum = 0 // 뒤 n자리 수
        let backNumArray = numArray[numArray.count/2..<numArray.count]
        var multiplier = 1
        
        for num in backNumArray.reversed() {
            backNum += multiplier * num
            multiplier *= 10
        }
        
        var compare = 1
        var num = backNum
        
        while backNum < Int(pow(10, Double(backNumArray.count))) {
            for _ in 0..<backNumArray.count {
                compare *= num % 10
                num /= 10
            }
            
            if target == compare {
                break
            } else {
                backNum += 1
            }
            num = backNum
            compare = 1
        }
        
        var result = ""
        for i in 0..<(numArray.count/2) {
            result += "\(numArray[i])"
        }
        
        result += "\(backNum)"
        return Int(result)!
    }
}
