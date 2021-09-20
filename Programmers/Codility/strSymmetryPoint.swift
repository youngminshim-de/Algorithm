//
//  strSymmetryPoint.swift
//  Programmers
//
//  Created by 심영민 on 2021/09/20.
//

import Foundation

class StrSysmmetryPoint {
    static func solution(_ S: inout String) -> Int {
        // S가 1일때 reutrn 0
        // S가 비어있을때 return -1
        // S가 짝수이면 return -1
        guard S.count > 1 else {
            return S.count - 1
        }
        
        guard S.count % 2 != 0 else {
            return -1
        }
        
        let str = S.map{String($0)}
        let index = str.count / 2
        var end = str.count - 1
        
        for char in str[0..<index] {
            if char != str[end] {
                return -1
            }
            end -= 1
        }
        return index
    }
}
