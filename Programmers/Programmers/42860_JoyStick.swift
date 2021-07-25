//
//  42860_JoyStick.swift
//  Programmers
//
//  Created by 심영민 on 2021/07/25.
//

import Foundation

class JoyStick {
    static func solution(_ name: String) -> Int{
        let charArray = ["A","B","C","D","E","F","G","H","I","J","K","L","M",
                         "N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
        var name = name.map{$0}
        var count = 0
        // 알파벳을 구하는 알고리즘
        for char in name {
            let targetIndex = charArray.firstIndex(of: String(char))!
            count += targetIndex > 13 ? (26 - targetIndex) : targetIndex
        }
        // 이동횟수를 구하는 알고리즘
        var minMove = name.count-1
        for i in 0..<name.count {
            if name[i] != "A" {
                var next = i + 1
                while next<name.count && name[next] == "A" {
                    // 연속적으로 A가 나오지 않을때까지 next를 증가시킨다.
                    next += 1
                }
                // 2*i 지금까지 온거리 *2 -> 왔다가 되돌아가는 경우
                // 문자열수 - next -> 끝나는 마지막 인덱스까지의 거리
                let move = (2 * i) + (name.count - next)
                minMove = min(move, minMove)
            }
        }
        return count + minMove
    }
}
