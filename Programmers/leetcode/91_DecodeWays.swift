//
//  DecodeWays.swift
//  Programmers
//
//  Created by 심영민 on 2021/11/05.
//

import Foundation

class DecodeWays {
    static func solution(_ s: String) -> Int {
        // A~Z ASCII : 97 ~ 122 -> -96 하면 1부터 가능 1~26까지
        // 11106
        // 0으로 시작하거나, 26보다 크면 안돼지
        let s = s.map{String($0)}
        var dp = Array(repeating: 0, count: s.count)
        
        for i in 0..<dp.count {
            if s[i] != "0" {
                dp[i] += (i>=1) ? dp[i-1] : 1
            }
            
            if i >= 1 {
                let combined = Int(s[i-1] + s[i])!
                if combined >= 10 && combined <= 26 {
                    dp[i] += (i>=2) ? dp[i-2] : 1
                }
            }
        }
        
        return dp.last ?? 0
    }
}
