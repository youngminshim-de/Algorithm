//
//  Problem1.swift
//  Programmers
//
//  Created by 심영민 on 2021/09/11.
//

import Foundation

class KaKao_Problem1 {
    func solution(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {
        var result = Array(repeating: 0, count: id_list.count)
        let reportSet: Set<String> = Set(report.map{$0})
        var countDictionary: [String: [String]] = [:]
        var resultDictionary: [String: Int] = [:]
        var array: [[String]] = Array(repeating: [], count: id_list.count)
        var dict: [String: Int] = [:]
        
        for value in reportSet {
            let input = value.components(separatedBy: " ").map{String($0)}
            let repoter = input[0]
            let user = input[1]
            
            array[id_list.firstIndex(of: repoter)!].append(user)
            dict[user, default:0] += 1
//            if countDictionary[user] == nil {
//                countDictionary[user] = [repoter]
//            } else {
//                countDictionary[user]?.append(repoter)
//            }
        }
        
        for i in 0..<array.count {
            for value in array[i] {
                if dict[value]! >= k {
                    result[i] += 1
                }
            }
        }
        
        
//        for (_, value) in countDictionary {
//            if value.count >= k {
//                value.forEach { repoter in
//                    resultDictionary[repoter, default:0] += 1
//                }
//            }
//        }
//
//        for (key, value) in resultDictionary {
//            result[id_list.firstIndex(of: key)!] = value
//        }

        return result
    }
}
