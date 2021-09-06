//
//  695_MaxAreaOfIsland.swift
//  Programmers
//
//  Created by 심영민 on 2021/09/06.
//

import Foundation

class MaxAreaOfIsland {
    static func maxAreaOfIsland(_ grid: [[Int]]) -> Int {
        var checkList = Array(repeating: Array<Int>(repeating: 0, count: grid[0].count), count: grid.count)
        var maxCount = 0
        
        func dfs(_ x: Int, _ y: Int) -> Int{
            guard x >= 0 && x < grid.count && y >= 0 && y < grid[0].count
                    && checkList[x][y] == 0 && grid[x][y] == 1 else {
                return 0
            }
            
            checkList[x][y] = 1
            var result = 1
            result += dfs(x-1, y)
            result += dfs(x, y-1)
            result += dfs(x+1, y)
            result += dfs(x, y+1)
            
            return result
        }
        
        for x in 0..<grid.count {
            for y in 0..<grid[x].count {
                if grid[x][y] == 1 {
                    maxCount = max(maxCount, dfs(x, y))
                }
            }
        }
        return maxCount
    }
    // 오답
    static func maxAreaOfIsland2(_ grid: [[Int]]) -> Int {
            var checkList = Array(repeating: Array<Int>(repeating: 0, count: grid[0].count), count: grid.count)
            var maxCount = 0
            let count = 0
            
            func dfs(_ x: Int, _ y: Int, _ count: Int) {
                guard x >= 0 && x < grid.count && y >= 0 && y < grid[0].count
                        && checkList[x][y] == 0 && grid[x][y] == 1 else {
                    maxCount = max(maxCount, count)
                    return
                }
                
                checkList[x][y] = 1
                dfs(x-1, y, count+1)
                dfs(x, y-1, count+1)
                dfs(x+1, y, count+1)
                dfs(x, y+1, count+1)
            }
            
            for x in 0..<grid.count {
                for y in 0..<grid[x].count {
                    if grid[x][y] == 1 {
                        dfs(x, y, count)
                    }
                }
            }
            return maxCount
        }
}
