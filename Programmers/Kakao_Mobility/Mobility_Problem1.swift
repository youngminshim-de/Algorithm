//
//  Mobility_Problem1.swift
//  Programmers
//
//  Created by 심영민 on 2021/10/29.
//

import Foundation

class Mobility_Problem1 {
//    static func solution(_ A: inout [Int], _ K: Int) -> Int {
//
//        if K > A.count {
//            return -1
//        }
//        var count1 = 0
//        var result = 0
//        var checkList = Array(repeating: false, count: A.count)
//
//        func dfs(_ count: Int, _ index: Int, _ sum: Int) {
//
//            guard count != K else {
//                if sum % 2 == 0 {
//                    result = max(result, sum)
//                }
//                return
//            }
//            for i in index..<A.count {
//                if !checkList[i] {
//                    checkList[i] = true
//                    dfs(count + 1, i, sum + A[i])
//                    checkList[i] = false
//                }
//            }
//        }
//
//        for i in 0..<A.count {
//            if !checkList[i] {
//                checkList[i] = true
//                dfs(1, i, A[i])
//            }
//        }
//
//        return result == 0 ? -1 : result
//    }
    
    static func solution(_ A: inout [Int], _ K: Int) -> Int {
        
        if K > A.count {
            return -1
        }
        var result = 0
        var checkList = Array(repeating: false, count: A.count)
        
        func dfs(_ count: Int, _ index: Int, _ sum: Int) {
            guard count < K else {
                if count == K && sum % 2 == 0 {
                    result = max(result, sum)
                }
                return
            }
            
            for i in index..<A.count {
                // 개수가 안될경우 return ?
                // 그럼 좀 줄일 수있나
                if !checkList[i] {
                    checkList[i] = true
                    dfs(count + 1, i, sum + A[i])
                    checkList[i] = false
                }
            }
        }
        
        dfs(0, 0, 0)
        
        return result == 0 ? -1 : result
    }
    
    static func solution2(_ A: inout [Int], _ K: Int) -> Int {
        
        if K > A.count {
            return -1
        }
        A.sort(by: <)
        var sum = 0
        var result = 0
        
        for i in 0..<A.count {
            for j in i+1..<K {
                sum += A[i] + A[j]
            }
            
            if sum % 2 == 0 {
                result = max(result, sum)
            }
            sum = 0
        }
        
        return result == 0 ? -1 : result
    }
    
}
