//
//  Problem1_RecommendNewId.swift
//  Programmers
//
//  Created by 심영민 on 2021/09/07.
//

import Foundation

class Problem1 {
    func solution(_ newId: String) -> String {
        var result = newId
        
        result = result.lowercased()
        result = removeImpossibleChar(result)
        result = removeContiunedDot(result)
        
        result = removeDot(result)
        
        if result.isEmpty {
            result.append("a")
        }
        
        while result.count > 15 {
            result.removeLast()
        }
        
        result = removeDot(result)
        
        while result.count < 3 {
            result.append(result.last!)
        }

        return result
    }
    
    func removeImpossibleChar(_ id: String) -> String {
        var newId = ""
        id.forEach {
            if $0.isNumber || String($0) == "-" || String($0) == "_" || String($0) == "." ||
                (String($0) >= "a" && String($0) <= "z")  {
                newId += String($0)
            }
        }
        return newId
    }
    
    func removeContiunedDot(_ id: String) -> String {
        let id = id.map{String($0)}
        var str = ""

        for char in id {
            if char == "." && str.last == "." {
                continue
            }
            str += char
        }
        return str
    }
    
    func removeDot(_ id: String) -> String {
        var id = id
        if id.first == "." {
            id.removeFirst()
        }
        if id.last == "." {
            id.removeLast()
        }
        return id
    }
}
