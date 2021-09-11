//
//  Problem2.swift
//  Programmers
//
//  Created by 심영민 on 2021/09/11.
//

import Foundation

class KaKao_Problem2 {
    func solution(_ n:Int, _ k:Int) -> Int {
        let convertNum = String(n, radix: k).map{String($0)}
        var result = 0
        var current = 0
        var next = 1
        var numArray: [Int] = []
        
        guard convertNum.count != 1 else {
            return isPrime(Int(convertNum[0])!) ? 1 : 0
        }
        
        while next < convertNum.count {
            if convertNum[current] == "0" {
                current += 1
                next = current + 1
            } else {
                if convertNum[next] == "0" {
                    numArray.append(Int(convertNum[current..<next].joined())!)
                    current = next
                }
                next += 1
            }
        }
        
        if convertNum.last != "0" {
            numArray.append(Int(convertNum[current..<convertNum.count].joined())!)
        }
        
        for num in numArray {
            if isPrime(num) {
                result += 1
            }
        }
        
        return result
    }
    
    func isPrime(_ number: Int) -> Bool {
        var isPrime = true
        
        guard number > 1 else {
            return false
        }
        guard number != 2 else {
            return true
        }
        
        for i in 2..<Int(sqrt(Double(number))) + 1 {
            if number % i == 0 {
                isPrime = false
                break
            }
        }
        return isPrime
    }
}
