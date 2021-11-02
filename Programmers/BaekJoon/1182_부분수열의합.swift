//
//  1182_부분수열의합.swift
//  Programmers
//
//  Created by 심영민 on 2021/11/02.
//

import Foundation

class PartialSequence {
    static func solution() {
        let input = readLine()!.components(separatedBy: " ").map{Int($0)!}
        let target = input[1]
        
        let sequenceArray = readLine()!.components(separatedBy: " ").map{Int($0)!}
        var checkList = Array(repeating: false, count: sequenceArray.count)
        var result = 0
        
        func dfs(_ index: Int, _ count: Int, _ targetCount: Int, _ sum: Int) {
            guard count != targetCount else {
                if sum == target {
                    result += 1
                }
                return
            }
            
            for i in index..<sequenceArray.count {
                if !checkList[i] {
                    checkList[i] = true
                    dfs(i, count+1, targetCount, sum+sequenceArray[i])
                    checkList[i] = false
                }
            }
        }
        
        for i in 1...sequenceArray.count {
            dfs(0, 0, i, 0)
        }
        
        print(result)
    }
    
    static func solution2() {
        let input = readLine()!.components(separatedBy: " ").map{Int($0)!}
        let target = input[1]
        
        let sequenceArray = readLine()!.components(separatedBy: " ").map{Int($0)!}
        var result = 0
        
        func dfs(_ count: Int, _ sum: Int) {
            guard sequenceArray.count != count else {
                if sum == target {
                    result += 1
                }
                return
            }
            dfs(count+1, sum)
            dfs(count+1, sum+sequenceArray[count])
        }
        
        dfs(0, 0)
        
        if target == 0 {
            result -= 1
        }
        print(result)
    }
}
