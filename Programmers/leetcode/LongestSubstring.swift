//
//  LongestSubstring.swift
//  Programmers
//
//  Created by 심영민 on 2021/07/31.
//

import Foundation

class LongestSubString {
    static func lengthOfLongestSubstring(_ s: String) -> Int {
        let str = s.map{$0}
        var result = 0
        
        var temp = ""
        for i in 0..<str.count {
            for j in i..<str.count {
                if temp.contains(str[j]) {
                    break
                } else {
                    temp += String(str[j])
                }
            }
            result = max(result, temp.count)
            temp = ""
        }
        return result
    }
}
