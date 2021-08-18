//
//  207_CourseSchedule.swift
//  Programmers
//
//  Created by 심영민 on 2021/08/18.
//

import Foundation

class CourseSchedule {
    static func canFinish(_ numCourses: Int, _ prerequisities: [[Int]]) -> Bool {
        var graph = [Int: [Int]]()
        var visited = [Int](repeating: 0, count: numCourses)
        
        for prereq in prerequisities {
            graph[prereq[0], default: []].append(prereq[1])
        }
        print(graph)
        
        for index in 0..<numCourses {
            guard dfs(graph, index, &visited) else {
                return false
            }
        }
        return true
    }
    
    static func dfs(_ graph: [Int: [Int]], _ index: Int, _ visited: inout [Int]) -> Bool {
        if visited[index] == 1 {
            return false
        }
        
        if visited[index] == 2 {
            return true
        }
        
        visited[index] = 1
        for neighbor in graph[index] ?? [] {
            guard dfs(graph, neighbor, &visited) else {
                return false
            }
        }
        visited[index] = 2
        return true
    }
    
    static func canFinish2(_ numCourses: Int, _ prerequisities: [[Int]]) -> Bool {
        var matrix = [[Int]](repeating: ([Int](repeating: 0, count: numCourses)), count: numCourses)
        var inDegree = [Int](repeating: 0, count: numCourses)
        var count = 0
        var queue = [Int]()
        
        for i in prerequisities {
            let ready = i[0]
            let pre = i[1]
            if matrix[pre][ready] == 0 {
                inDegree[ready] += 1
            }
            matrix[pre][ready] = 1
        }
        
        print(matrix)
        // 진입차수가 0 이면 큐에 넣는다.
        for i in 0..<inDegree.count {
            if inDegree[i] == 0 {
                queue.append(i)
            }
        }
        
        // queue가 빌 때까지 반복한다.
        while !queue.isEmpty {
            let course = queue.removeFirst()
            count += 1
            for i in 0..<numCourses {
                if matrix[course][i] != 0 {
                    inDegree[i] -= 1
                    if inDegree[i] == 0 {
                        queue.append(i)
                    }
                }
            }
        }
        return count == numCourses
    }
}

