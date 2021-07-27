//
//  Chess.swift
//  Programmers
//
//  Created by 심영민 on 2021/07/27.
//

import Foundation

class Chess {
    static func queensAttacktheKing(_ queens: [[Int]], _ king: [Int]) -> [[Int]] {
        
        var result = [[Int]]()
        for i in 0..<queens.count {
            // 대각선
            if abs(queens[i][0] - king[0]) == abs(queens[i][1] - king[1]) {
                let xMax = max(queens[i][1], king[1])
                let xMin = min(queens[i][1], king[1])
                let yMax = max(queens[i][0], king[0])
                let yMin = min(queens[i][0], king[0])
                
                var canAttack = true
                
                for j in 0..<queens.count {
                    // x,y좌표가 같고, x값이 킹과 퀸의 사이에 있는 또다른 퀸이 있다면
                    if (abs(queens[j][0] - king[0]) == abs(queens[j][1] - king[1])) &&
                        queens[j][0] > yMin && queens[j][0] < yMax &&
                        queens[j][1] > xMin && queens[j][1] < xMax{
                        canAttack = false
                        break
                    }
                }
                if canAttack {
                    result.append(queens[i])
                }
                
            } else if (queens[i][0] == king[0]) { // 가로 같은 라인 (같은 y축)
                let max = max(queens[i][1], king[1])
                let min = min(queens[i][1], king[1])
                var canAttack = true
                
                for j in 0..<queens.count {
                    // y좌표가 같고, x값이 킹과 퀸의 사이에 있는 또다른 퀸이 있다면
                    if queens[j][0] == king[0] && queens[j][1] > min && queens[j][1] < max {
                        canAttack = false
                        break
                    }
                }
                if canAttack {
                    result.append(queens[i])
                }
            
            } else if (queens[i][1] == king[1]) { // 세로 같은 라인 (같은 x축)
                let max = max(queens[i][0], king[0])
                let min = min(queens[i][0], king[0])
                var canAttack = true
                
                for j in 0..<queens.count {
                    // x좌표가 같고, y값이 킹과 퀸의 사이에 있는 또다른 퀸이 있다면
                    if queens[j][1] == king[1] && queens[j][0] > min && queens[j][0] < max {
                        canAttack = false
                        break
                    }
                }
                if canAttack {
                    result.append(queens[i])
                }
            }
        }
        return result
    }
}
