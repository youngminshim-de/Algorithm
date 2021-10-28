//
//  CarProblem1.swift
//  Programmers
//
//  Created by 심영민 on 2021/10/28.
//

import Foundation

class Car_Problem1 {
    static func solution(_ s: String) -> Int {
        // 성공하면 1 리턴, 아니면 0 리턴
        var answer = 0
//        let s = s.map{String($0)}
        var stack: [String] = []
        
        for char in s {
            if stack.last == String(char) {
                stack.removeLast()
            } else {
                stack.append(String(char))
            }
        }
        
        answer = stack.isEmpty ? 1 : 0
        return answer
    }
}
