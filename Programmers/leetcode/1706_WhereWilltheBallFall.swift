//
//  1706_WhereWilltheBallFall.swift
//  Programmers
//
//  Created by 심영민 on 2021/10/12.
//

import Foundation

class WhereWilltheBallFall {
    
    static func solution(_ grid: [[Int]]) -> [Int] {
        var columnIndex = 0
        var result = Array(repeating: 0, count: grid[0].count)
        
        for ballIndex in 0..<grid[0].count {
            columnIndex = ballIndex
            
            for rowIndex in 0..<grid.count {
                if grid[rowIndex][columnIndex] == 1 && columnIndex == grid[0].count - 1 {
                    result[ballIndex] = -1
                    break
                } else if grid[rowIndex][columnIndex] == -1 && columnIndex == 0 {
                    result[ballIndex] = -1
                    break
                } else if grid[rowIndex][columnIndex] == 1 && grid[rowIndex][columnIndex+1] == -1 { // \
                    result[ballIndex] = -1
                    break
                } else if grid[rowIndex][columnIndex] == -1 && grid[rowIndex][columnIndex-1] == 1{
                    result[ballIndex] = -1
                    break
                } else if grid[rowIndex][columnIndex] == 1 {
                    columnIndex += 1
                } else if grid[rowIndex][columnIndex] == -1 {
                    columnIndex -= 1
                }
                if rowIndex == grid.count-1 {
                    result[ballIndex] = columnIndex
                }
            }
        }
        
        return result
    }
}
