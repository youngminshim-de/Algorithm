//
//  5_LongestPalindromicSubstring.swift
//  Programmers
//
//  Created by 심영민 on 2021/10/19.
//

import Foundation

class LongestPalindromicSubstring {
    static func solution(_ s: String) -> String {
        guard s.count > 1 else {
            return s
        }
        
        let s = s.map{String($0)}
        var isPalindrome = Array(repeating: Array(repeating: false, count: s.count), count: s.count)
        var left = 0
        var right = 0
        
        // palindrome이 될 조건
        // 양 끝이 같고, 가운데가 문자가 하나일 경우 i - j <= 2 가운데 문자가 하나
        // 양 끝이 같은데, 안이 이미 palindrome일 경우 -> isPalindrome[j+1][i-1] 이 true
        
        // i = right, j = left
        for i in 0..<s.count {
            for j in 0..<i {
                // s[i] == s[j] 양끝이 같음을 비교
                if s[i] == s[j] && ( isPalindrome[j+1][i-1] || i - j <= 2) {
                    isPalindrome[j][i] = true
                    
                    if i - j > right - left {
                        right = i
                        left = j
                    }
                }
            }
        }
        return Array(s[left...right]).joined()
    }
}
