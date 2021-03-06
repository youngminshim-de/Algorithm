//
//  1260_DFS.swift
//  Programmers
//
//  Created by 심영민 on 2021/07/10.
//

import Foundation

class FS {
    static func dfs(graph: [Int: [Int]], start: Int) -> [Int] {
        var visitedQueue: [Int] = []
        var needVisitStack: [Int] = [start]
        
        while !needVisitStack.isEmpty {
            let node: Int = needVisitStack.removeLast()
            if visitedQueue.contains(node) {
                continue
            }
            
            visitedQueue.append(node)
            needVisitStack += graph[node] ?? []
        }
        return visitedQueue
    }
    
    static func bfs(graph: [Int: [Int]], start: Int) -> [Int] {
        var visitedQueue: [Int] = []
        var needVisitQueue: [Int] = [start]
        
        while !needVisitQueue.isEmpty {
            let node: Int = needVisitQueue.removeFirst()
            if visitedQueue.contains(node) {
                continue
            }
            
            visitedQueue.append(node)
            needVisitQueue += graph[node] ?? []
        }
        return visitedQueue
    }
    
    static func printResult() {
        let input = readLine()!.components(separatedBy: " ").map{Int($0)!}

        let N = input[0]
        let M = input[1]
        let V = input[2]
        
        var graph = [Int: [Int]]()
        for _ in 0..<M{
            let connectNumber = readLine()!.components(separatedBy: " ").map{Int($0)!}
            let start = connectNumber.first!
            let end = connectNumber.last!
            
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
        // 그래프는 순서가 없다.
        // 문제에 나와있는 출력 구조를 맞추기 위해
        // DFS는 스택구조이므로 내림차순으로 정렬해준다.
        for key in graph.keys {
            graph[key]?.sort(by: >)
        }
        
        var result = ""
        for i in dfs(graph: graph, start: V) {
            result += "\(i) "
        }
        print(result)
        // BFS는 스택구조이므로 내림차순으로 정렬해준다.
        for key in graph.keys {
            graph[key]?.sort(by: <)
        }
        result = ""
        for i in bfs(graph: graph, start: V) {
            result += "\(i) "
        }
        
        print(result)
    }
}
