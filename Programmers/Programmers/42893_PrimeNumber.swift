//
//  42893_PrimeNumber.swift
//  Programmers
//
//  Created by 심영민 on 2021/07/10.
//

import Foundation

class PrimeNumber {
    static func solution(_ numbers:String) -> Int {
        
        let numberArray = numbers.map { String($0) }
        var primeNumberArray: [Int] = []
        var checkList: [Int] = Array(repeating: 0, count: numbers.count)
        var number = ""
        
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
        
        func dfs(_ depth: Int, _ string: String, _ count: Int) {
            if depth == count {
                if let number = Int(string) {
                    if isPrime(number) && !primeNumberArray.contains(number) {
                        primeNumberArray.append(number)
                    }
                }
            } else {
                for i in 0..<numberArray.count {
                    if checkList[i] == 0 { // 해당 숫자가 체크되어있지 않은 경우
                        number += numberArray[i]
                        checkList[i] = 1
                        dfs(depth + 1, number, count)
                        checkList[i] = 0
                        number = string
                    }
                }
            }
        }
        
        for i in 1...numberArray.count {
            dfs(0, "", i)
        }
    
        return primeNumberArray.count
    }
}
