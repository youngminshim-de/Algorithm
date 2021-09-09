//
//  CompressionString.swift
//  Programmers
//
//  Created by 심영민 on 2021/09/09.
//

import Foundation

class CompressionString {
    func solution(_ s: String) -> Int {
        let s = s.map{String($0)}
        var current = 0
        var next = 0
        var minimumLength = 1001
        var result = ""
        var count = 1
        guard s.count != 1 else {
            return 1
        }
        for i in 1..<s.count/2+1 {
            count = 1
            current = 0
            next = current + i
            while next+i < s.count {
                if s[current..<current+i] == s[next..<next + i] {
                    count += 1
                } else {
                    if count != 1 {
                        result += "\(count)"
                    }
                    result += "\(s[current..<current+i].joined())"
                    count = 1
                    current = next
                }
                next += i
            }
            if s[current..<current+i] == s[next..<s.count] {
                count += 1
                result += "\(count)\(s[current..<current+i].joined())"
            } else if count != 1 {
                result += "\(count)\(s[current..<current+i].joined())\(s[next..<s.count].joined())"
            } else {
                result += "\(s[current..<s.count].joined())"
            }
            
            minimumLength = min(result.count, minimumLength)
            result = ""
        }
        
        return minimumLength
    }
}
