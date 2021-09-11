//
//  Problem5.swift
//  Programmers
//
//  Created by 심영민 on 2021/09/11.
//

import Foundation

class KaKao_Problem5 {
    func solution(_ info: [Int], _ edges: [[Int]]) -> Int {
        let graph = makeGraph(edges)
        var checkList = Array(repeating: false, count: info.count)
        var maximumSheepNumber = 0
        var result = Array(repeating: 0, count: 2)
        print(graph)
        dfs(start: 0, result: &result)
        
        func dfs(start: Int, result: inout [Int]) {
            
            guard graph[start] != nil else {
                maximumSheepNumber = max(maximumSheepNumber, result[0])
                return
            }
            
            if info[start] == 0 {
                result[0] += 1
            } else {
                result[1] += 1
            }
            
            guard result[0] > result[1] else {
                maximumSheepNumber = max(maximumSheepNumber, result[0])
                return
            }
                        
            for index in graph[start]! {
                if !checkList[index] {
                    checkList[index] = true
                    dfs(start: index, result: &result)
                    checkList[index] = false
                }

            }
        }
        
        return maximumSheepNumber
    }
    
    func makeGraph(_ edges: [[Int]]) -> [Int: [Int]] {
        var graph = [Int: [Int]]()
        
        for i in 0..<edges.count {
            let start = edges[i][0]
            let end = edges[i][1]
            
            if graph[start] == nil {
                graph[start] = [end]
            } else {
                graph[start]?.append(end)
            }
            if graph[end] == nil {
                graph[end] = [start]
            } else {
                graph[end]?.append(start)
            }
        }
        
        return graph
    }
}
