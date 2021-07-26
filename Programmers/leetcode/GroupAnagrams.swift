//
//  GroupAnagrams.swift
//  Programmers
//
//  Created by 심영민 on 2021/07/26.
//

import Foundation

class GroupAnagrams {
    static func groupAnagrams(_ strs: [String]) -> [[String]] {
        var sortedStr = strs.map{$0.sorted(by: <)}
        var result = [[String]]()
        var tempArray = Array<String>()
        
        for i in 0..<sortedStr.count {
            if sortedStr[i] == ["O"]{
                continue
            }
            tempArray.append(strs[i])
            for j in i+1..<sortedStr.count {
                if sortedStr[i] == sortedStr[j] && sortedStr[i] != ["O"] {
                    tempArray.append(strs[j])
                    sortedStr[j] = ["O"]
                }
            }
            if tempArray.count != 0 {
                result.append(tempArray)
                tempArray = []
            }
        }
        return result
    }
    
    static func groupAnagrams2(_ strs: [String]) -> [[String]] {
        var map = [String: [String]]()
        for str in strs {
            let key = String(str.sorted())
            if !map.keys.contains(key) {
                map[key] = [String]()
            }
            map[key]?.append(str)
        }
        return Array(map.values)
    }
}
