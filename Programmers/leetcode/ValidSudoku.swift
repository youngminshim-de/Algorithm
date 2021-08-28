//
//  ValidSudoku.swift
//  Programmers
//
//  Created by 심영민 on 2021/08/28.
//

import Foundation

class ValidSudoku {
    static func isVaildSudoku(_ board: [[Character]]) -> Bool {
        var horizontalResult = Set<Character>()
        var verticalResult = Set<Character>()
        var squareResult = Set<Character>()
        
        for value in board {
            for item in value {
                if !horizontalResult.insert(item).inserted && item != "." {
                    return false
                }
            }
            horizontalResult.removeAll()
        }
        
        for i in 0..<board.count {
            for j in 0..<board.count {
                if !verticalResult.insert(board[j][i]).inserted && board[j][i] != "." {
                    return false
                }
            }
            verticalResult.removeAll()
        }
        
        for i in [0,3,6] {
            for j in [0,3,6] {
                for k in 0..<3 {
                    for l in 0..<3 {
                        if !squareResult.insert(board[k+i][l+j]).inserted && board[k+i][j+l] != "." {
                            return false
                        }
                    }
                }
                squareResult.removeAll()
            }
        }
        
        return true
    }
}
