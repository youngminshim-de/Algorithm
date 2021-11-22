//
//  11726_2Xn_Tiling.swift
//  Programmers
//
//  Created by 심영민 on 2021/11/22.
//

import Foundation

class Tiling {
    static func solution() -> Int{
        let input = readLine()!
        
        guard let input = Int(input) else {
            return 0
        }
        
        guard input > 3 else {
            return input
        }
        
        let constant = 10007
        var result = Array(repeating: 0, count: input)
        result[0] = 1
        result[1] = 2
        result[2] = 3
        
        for i in 3..<input {
            result[i] = (result[i-1] + result[i-2]) % constant
        }
        
        return result.last!
    }
}
