//
//  Problem1.swift
//  Programmers
//
//  Created by 심영민 on 2021/09/18.
//

import Foundation

class Baemin1 {
    static func solution(_ U: Int, _ L: Int, _ C: inout [Int]) -> String {
        var U = U
        var L = L
        let sum = C.reduce(0, +)
        
        guard sum == (U+L) else {
            return "IMPOSSIBLE"
        }
        
        guard U <= C.count && L <= C.count else{
            return "IMPOSSIBLE"
        }

        var upperRow: [Int] = Array(repeating: 0, count: C.count)
        var lowerRow: [Int] = Array(repeating: 0, count: C.count)
        
        for index in 0..<C.count {
            if C[index] == 2 && U != 0 && L != 0 {
                upperRow[index] = 1
                lowerRow[index] = 1
                U -= 1
                L -= 1
            } else if C[index] == 1 && U != 0 {
                upperRow[index] = 1
                U -= 1
            } else if C[index] == 1 && L != 0 {
                lowerRow[index] = 1
                L -= 1
            }
        }
        
        guard U == 0, L == 0 else {
            return "IMPOSSIBLE"
        }
        
        let upperRowString = upperRow.map{String($0)}.joined()
        let lowerRowString = lowerRow.map{String($0)}.joined()
        
        return "\(upperRowString),\(lowerRowString)"
    }
}

//else if C[index] == 2 && ( U == 0 || L == 0) {
//    return "IMPOSSIBLE"
//}

//for index in 0..<C.count {
//    if C[index] == 0 {
//        continue
//    } else if C[index] == 2 && U != 0 && L != 0 {
//        upperRow[index] = 1
//        lowerRow[index] = 1
//        U -= 1
//        L -= 1
//    } else if C[index] == 1 && U != 0 {
//        upperRow[index] = 1
//        U -= 1
//    } else if C[index] == 1 && L != 0 {
//        lowerRow[index] = 1
//        L -= 1
//    } else {
//        return "IMPOSSIBLE"
//    }
//}
