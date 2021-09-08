//
//  Problem2_MenuRenewal.swift
//  Programmers
//
//  Created by 심영민 on 2021/09/08.
//

import Foundation

class MenuRenewal {
    func solution(_ orders: [String], _ course: [Int]) -> [String] {
        var result: [String: Int] = [:]
        var checkList: [Int] = []
        var temps: [[String: Int]] = []
        
        for i in 0..<course.count {
            for order in orders {
                checkList = Array(repeating: 0, count: order.count)
                dfs(0, 0, "", order.map{String($0)}.sorted(by: <), course[i])
            }
        }
        
        
        func dfs(_ count: Int, _ currnetIndex: Int, _ str: String, _ order: [String], _ depth: Int) {
            if count == depth {
                result[str, default: 0] += 1
                return
            }
            
            for i in currnetIndex..<order.count {
                if checkList[i] == 0 {
                    checkList[i] = 1
                    dfs(count+1, i, str + order[i], order, depth)
                    checkList[i] = 0
                }
            }
        }
        
        for (key, value) in result {
            if value == 1 {
                result.removeValue(forKey: key)
            }
        }
        
        for count in course {
            temps.append(result.filter{$0.key.count == count})
        }
        
        for temp in temps {
            let maximumValue = temp.values.max() ?? 0
            for (key, value) in temp {
                if maximumValue > value {
                    result.removeValue(forKey: key)
                }
            }
        }
        
        return result.map{$0.key}.sorted(by: <)
    }
}
