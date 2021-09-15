//
//  43163_ConvertWords.swift
//  Programmers
//
//  Created by 심영민 on 2021/09/15.
//

import Foundation

class ConvertWords {
    static func solution(_ begin: String, _ target: String, _ words: [String]) -> Int {
        var result = 51
        var visited = Array(repeating: false, count: words.count)
        
        func dfs(_ begin: String, _ count: Int) {
            guard begin != target else {
                result = min(result, count)
                return
            }
            
            for i in 0..<words.count {
                let str1 = begin.map{String($0)}
                let str2 = words[i].map{String($0)}
                var cnt = 0
                
                for i in 0..<str1.count {
                    if str1[i] != str2[i] {
                        cnt += 1
                    }
                    if cnt > 1 {
                        break
                    }
                }
                if cnt == 1 && !visited[i]{
                    visited[i] = true
                    dfs(words[i], count+1)
                    visited[i] = false
                }
            }
        }
        
        dfs(begin, 0)
        return result == 51 ? 0 : result
    }
}
