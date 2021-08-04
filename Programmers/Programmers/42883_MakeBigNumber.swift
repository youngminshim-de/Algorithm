//
//  42883_MakeBigNumber.swift
//  Programmers
//
//  Created by 심영민 on 2021/08/02.
//

import Foundation

class BigNumber {
    static func solution(_ number: String, _ k: Int) -> String {
        var numbers = number.map{$0}
        var count = 0
        while k > count {
            for i in 0..<numbers.count-1 {
                if numbers[i] < numbers[i+1] {
                    numbers.remove(at: i)
                    count += 1
                    break
                }
            }
            if count == 0 {
                for _ in 0..<k {
                    numbers.removeLast()
                }
                break
            }
        }

        let result = numbers.reduce("") {$0+String($1)}
        return result
    }
    
    static func solution2(_ number: String, _ k: Int) -> String {
        let numbers: [Character] = number.map{ $0 }
        var stack: [Character] = []
        var removeCount = 0
        var index = 0
        
        while index < numbers.count && removeCount < k {
            // 스택이 비어있다면 현재 인덱스의 숫자를 넣는다.
            // Index는 1 증가
            guard let last = stack.last else {
                stack.append(numbers[index])
                index += 1
                continue
            }
            // 스택의 마지막 숫자보다 현재 인덱스의 숫자가 크다면
            // 스택의 마지막 숫자를 지우고 removeCount를 1 증가시킨다.
            if last < numbers[index] {
                stack.removeLast()
                removeCount += 1
                continue
            }
            
            stack.append(numbers[index])
            index += 1
        }
        // k개의 숫자를 지운경우
        // 아직 탐색하지 못한 숫자들은 stack에 그대로 이어붙인다.
        if removeCount == k {
            stack.append(contentsOf: numbers[index...])
        }
        
        // index 끝까지 탐색했지만 k개 만큼 지우지 못한경우
        // 뒤에서부터 k개는 제거한다. (내림차순 정렬의 경우)
        if index == numbers.count {
            return stack[0..<numbers.count-k].reduce(""){$0+String($1)}
        }
        
        return stack.reduce("") {$0+String($1)}
    }
}
