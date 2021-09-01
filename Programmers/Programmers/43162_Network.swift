//
//  43162_Network.swift
//  Programmers
//
//  Created by 심영민 on 2021/09/01.
//

import Foundation

class Network {
    static func solution(_ n: Int, _ computers: [[Int]]) -> Int {
        
        var visited = Array<Bool>(repeating: false, count: n)
        var result = 0
        
        func dfs(_ index: Int) {
            visited[index] = true
            for i in 0..<n {
                if computers[index][i] == 1 && visited[i] == false {
                    dfs(i)
                }
            }
        }
        for i in 0..<n {
            if !visited[i] {
                result += 1
                dfs(i)
            }
        }
        return result
    }
}
