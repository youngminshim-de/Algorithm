//
//  KeysAndRooms.swift
//  Programmers
//
//  Created by 심영민 on 2021/08/04.
//

import Foundation

class KeysAndRooms {
    static func canVisitAllRooms(_ rooms: [[Int]]) -> Bool {
        let graph = rooms
        var visited = Set<Int>()
        dfs(graph, &visited, node: 0)
        return visited.count == rooms.count
    }
    
    static func dfs(_ graph: [[Int]], _ visited: inout Set<Int>, node: Int) {
        visited.insert(node)
        for value in graph[node] {
            if !visited.contains(value) {
                dfs(graph, &visited, node: value)
            }
        }
    }
}
