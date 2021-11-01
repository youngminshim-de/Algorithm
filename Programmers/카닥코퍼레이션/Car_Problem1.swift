//
//  CarProblem1.swift
//  Programmers
//
//  Created by 심영민 on 2021/10/28.
//

import Foundation

class Car_Problem1 {
    // 짝지어 제거하기 (스택을 이용한다.)
    static func solution(_ s: String) -> Int {
        // 성공하면 1 리턴, 아니면 0 리턴
        // 스택에 들어있는 마지막 char가 현재의 char와 같다면 stack의 마지막 원소를 지운다.
        // 그렇지 않다면 스택에 원소를 추가한다.
        
        var answer = 0
        var stack: [String] = []
        
        for char in s {
            if stack.last == String(char) {
                stack.removeLast()
            } else {
                stack.append(String(char))
            }
        }
        // 스택이 비어있다면 모두 짝지어 제거된 것이기에 1을 리턴한다.
        answer = stack.isEmpty ? 1 : 0
        return answer
    }
}
