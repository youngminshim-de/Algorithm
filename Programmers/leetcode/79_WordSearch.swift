//
//  79_WordSearch.swift
//  Programmers
//
//  Created by 심영민 on 2021/10/18.
//

import Foundation

class WordSearch {
    static func solution(_ board: [[Character]], _ word: String) -> Bool {
        var checkList = Array(repeating: Array(repeating: false, count: board[0].count), count: board.count)
        var answer: Bool = false
        let word = word.map{String($0)}
        
        if board.count == 1 && board[0].count == 1 {
            if word.count == 1 {
                return String(board[0][0]) == word[0]
            } else {
                return false
            }
        }

        func dfs(_ row: Int, _ column: Int, _ current: Int, _ result: String) {
            guard row >= 0 && row < board.count else {
                return
            }
            guard column >= 0 && column < board[0].count else {
                return
            }
            guard current < word.count else {
                if word.joined() == result {
                    answer = true
                }
                return
            }
            
            if !checkList[row][column] && ( word[current] == String(board[row][column]) ) {
                checkList[row][column] = true
                dfs(row-1, column, current + 1 ,result + String(board[row][column]))
                dfs(row+1, column, current + 1, result + String(board[row][column]))
                dfs(row, column-1, current + 1, result + String(board[row][column]))
                dfs(row, column+1, current + 1, result + String(board[row][column]))
                checkList[row][column] = false
            }
        }

        for i in 0..<board.count {
            for j in 0..<board[i].count {
                dfs(i, j, 0, "")
            }
        }
        return answer
    }
}
