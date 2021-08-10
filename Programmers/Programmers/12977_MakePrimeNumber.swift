//
//  12977_MakePrimeNumber.swift
//  Programmers
//
//  Created by 심영민 on 2021/08/10.
//

import Foundation

class MakePrimeNumber {
    static func solution(_ nums: [Int]) -> Int {
        var result = 0
        
        func isPrime(_ num: Int) -> Bool {
            guard num > 1 else {
                return false
            }
            
            guard num != 2 else {
                return true
            }
            
            for i in 2..<Int(sqrt(Double(num))) + 1 {
                if num % i == 0 {
                    return false
                }
            }
            return true
        }
        
        func dfs(_ sum: Int, _ count: Int, _ index: Int) {
            if count == 3 {
                if isPrime(sum) {
                    result += 1
                }
            }
            else {
                for i in index..<nums.count {
                    dfs(sum+nums[i], count + 1, i+1)
                }
            }
        }
        
        for i in 0..<nums.count {
            dfs(nums[i], 1, i+1)
        }
        return result
    }
}
