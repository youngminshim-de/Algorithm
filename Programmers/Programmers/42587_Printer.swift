//
//  42587_Printer.swift
//  Programmers
//
//  Created by 심영민 on 2021/07/06.
//

import Foundation

class Printer {
    
    static func solution(_ priorities: [Int], _ location: Int) -> Int {
        var tempArray = priorities
        var count = 0
        var isPrinted = true
        priorities.contains(where: {$0 > priorities[0]})
        while true {
            for i in 0..<tempArray.count {
                isPrinted = true
                for j in 0..<tempArray.count {
                    if tempArray[i] < tempArray[j] {
                        isPrinted = false
                        break
                    }
                }
                if isPrinted && i == location {
                    count += 1
                    return count
                } else if isPrinted {
                    tempArray[i] = 0
                    count += 1
                }
            }
        }
    }
    
    static func solution2(_ priorities:[Int], _ location: Int) -> Int {
        var priorityArray = priorities
        var first = 0
        var targetIndex = location
        
        while priorityArray.count > 0 {
            if priorityArray.contains(where: { $0 > priorityArray[0] }) {
                first = priorityArray.removeFirst()
                priorityArray.append(first)
                targetIndex = targetIndex - 1 >= 0 ? targetIndex - 1 : priorityArray.count - 1
            } else {
                if targetIndex == 0 {
                    return priorities.count - priorityArray.count + 1
                }
                
                priorityArray.removeFirst()
                targetIndex -= 1
            }
        }
        return 0
    }
}
