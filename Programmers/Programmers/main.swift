//
//  main.swift
//  Programmers
//
//  Created by 심영민 on 2021/07/05.
//

import Foundation

func solution(_ str: String) -> Int {
    var tempString = str
    var prevString = tempString
    while true {
        tempString = tempString.replacingOccurrences(of: "()", with: "")
        if tempString == prevString {
            return tempString.count
        }
        prevString = tempString
    }
}
let input = readLine()!
print(solution(input))

//print(solution(")))()"))
//print(solution(")(()"))
//print(solution("))()(("))
//print(solution(")(()(()))"))
// String에서 ()을 뺀다 계속해서 없을때까지
// 없을때까지를 어떻게 판단해야 할까... 흠...
// ( 72 .. ) 73
// 탈출조건을 어떻게 잡아야 되지
