//
//  Car_Problem4.swift
//  Programmers
//
//  Created by 심영민 on 2021/10/28.
//

import Foundation

class Car_Problem4 {
    static func solution(_ n: Int) -> Int {
        
        var result = 0
        let binary = String(n, radix: 2)
        let numberOfOne = binary.reduce(into: [:]) { counts, letter in
            counts[letter, default: 0] += 1
        }["1"]!
        
        func dfs(_ string: String, _ count: Int) {
            
            if string.count == binary.count && count == numberOfOne {
                if binary > string {
                    result += 1
                }
                return
            }
            
            guard string.count < binary.count else {
                return
            }
            
            dfs(string + "0", count)
            dfs(string + "1", count + 1)
        }
        dfs("", 0)
        return result
    }
    
    static func solution2(_ n: Int) -> Int {
        var result = 0
        let binary = String(n, radix: 2)
        
        // n을 이진수로 바꾼 binary에 1이 몇개가 있는지 count하여 numberOfOne에 담는다.
        // 즉 1의 개수
        let numberOfOne = binary.reduce(into: [:]) { counts, letter in
            counts[letter, default: 0] += 1
        }["1"]!
        
        var array = Array(repeating: "0", count: binary.count)
        // 1의 개수개 만큼 뽑는 조합 -> dfs를 이용하여 해결
        func dfs(_ array: inout [String], _ count: Int, _ index: Int) {
            
            if count == numberOfOne {
                let string = array.joined(separator: "")
                if binary > string {
                    result += 1
                }
                return
            }
            
            for i in index..<binary.count {
                if array[i] == "0" {
                    array[i] = "1"
                    dfs(&array, count + 1, i)
                    array[i] = "0"
                }
            }
        }
        
        dfs(&array, 0, 0)
        
        return result
    }
    
}
