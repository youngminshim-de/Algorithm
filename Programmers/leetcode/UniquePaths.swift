//
//  UniquePaths.swift
//  Programmers
//
//  Created by 심영민 on 2021/10/26.
//

import Foundation

class UniquePaths {
    static func solution(_ m: Int, _ n: Int) -> Int {
        var checkList = Array(repeating: Array(repeating: false, count: n), count: m)
        var result = 0
        func dfs(_ row: Int, _ column: Int) {
            guard row != m-1 || column != n-1  else {
                result += 1
                return
            }
    
            guard row < m && column < n else {
                return
            }
            
            if !checkList[row][column] {
                checkList[row][column] = true
                dfs(row+1, column)
                dfs(row, column+1)
                checkList[row][column] = false
            }
        }
        dfs(0,0)
        return result
    }
    
    static func solution2(_ m: Int, _ n: Int) -> Int {
//        if m < 2 || n < 2 {
//            return 1
//        }
    
//        result[0][0] = 0
//        for column in 1..<n {
//            result[0][column] = 1
//        }
//        for row in 1..<m {
//            result[row][0] = 1
//        }
        var result = Array(repeating: Array(repeating: 1, count: n), count: m)
        
        for x in 1..<m {
            for y in 1..<n {
                result[x][y] = result[x-1][y] + result[x][y-1]
            }
        }
        
        return result[m-1][n-1]
    }
}
