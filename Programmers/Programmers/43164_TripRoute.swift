//
//  43164_TripRoute.swift
//  Programmers
//
//  Created by 심영민 on 2021/09/29.
//

import Foundation

class TripRoute {
    static func solution(_ tickets: [[String]]) -> [String] {
        let sortedTickets = tickets.sorted(by: {$0[1] < $1[1]})
        var checkList = Array(repeating: false, count: tickets.count)
        var result = [String]()
        
        func dfs(_ start: String) {
            guard result.count != tickets.count else {
                result.append(start)
                return
            }
            
            for i in 0..<sortedTickets.count {
                let depature = sortedTickets[i][0]
                let arrive = sortedTickets[i][1]
                
                if depature == start && !checkList[i] {
                    checkList[i] = true
                    result.append(depature)
                    dfs(arrive)
                    
                    if result.count == tickets.count + 1 {
                        return
                    }
                    
                    result.removeLast()
                    checkList[i] = false
                }
            }
        }
        
        dfs("ICN")
        return result
    }
}

