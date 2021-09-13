//
//  OpenChatting.swift
//  Programmers
//
//  Created by 심영민 on 2021/09/13.
//

import Foundation

class OpenChatting {
    static func solution(_ record: [String]) -> [String] {
                
        var userId: [String: String] = [:]
        var enterOrLeave: [String] = []
        var order: [String] = []
        var result: [String] = []
        
        for value in record {
            let string = value.components(separatedBy: " ")
            
            if string[0] == "Enter" {
                enterOrLeave.append("님이 들어왔습니다.")
                userId[string[1]] = string[2]
                order.append(string[1])
            } else if string[0] == "Leave" {
                enterOrLeave.append("님이 나갔습니다.")
                order.append(string[1])
                
            } else if string[0] == "Change" {
                userId[string[1]] = string[2]
            }
        }
        
        for i in 0..<order.count {
            result.append("\(userId[order[i]]!)\(enterOrLeave[i])")
        }
        return result
    }
}
