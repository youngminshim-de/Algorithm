//
//  73_SetMatrixZeroes.swift
//  Programmers
//
//  Created by 심영민 on 2021/10/27.
//

import Foundation

class SetMatrixZeroes {
    
    static func solution(_ matrix: inout [[Int]]) {
        var columnCheckList = Array(repeating: false, count: matrix[0].count)
        var rowCheckList = Array(repeating: false, count: matrix.count)
        
        for row in 0..<matrix.count {
            for column in 0..<matrix[row].count {
                if matrix[row][column] == 0 {
                    rowCheckList[row] = true
                    columnCheckList[column] = true
                }
            }
            if rowCheckList[row] {
                matrix[row] = Array(repeating: 0, count: matrix[row].count)
            }
        }
        
        for i in 0..<columnCheckList.count {
            if columnCheckList[i] {
                for j in 0..<matrix.count {
                    matrix[j][i] = 0
                }
            }
        }
    }
}
