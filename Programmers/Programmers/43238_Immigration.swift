//
//  43238_Immgration.swift
//  Programmers
//
//  Created by 심영민 on 2021/09/30.
//

import Foundation

class Immigration {
    static func solution(_ n: Int, _ times: [Int]) -> Int {
        var result = 1000000001
        let times = times.sorted(by: <)
        
        var minTime = 1
        var maxTime = times.max()! * n
        var midTime = 0
        
        var sum = 0
        let target = n
        
        while minTime < maxTime {
            midTime = ((minTime + maxTime) / 2)
            sum = 0
            for time in times {
                sum += (midTime / time)
            }
            
            if sum == target {
                result = min(result, midTime)
            } else if sum > target {
                maxTime = midTime - 1
            } else if sum < target {
                minTime = midTime + 1
            }
        }
        return result
    }
    
    static func solution2(_ n: Int, _ times: [Int]) -> Int {
        var result = 0
        let times = times.sorted(by: <)
        
        var minTime = 1
        var maxTime = times.max()! * n
        
        while minTime <= maxTime {
            let midTime = ((minTime + maxTime) / 2)
            var sum = 0
            
            for time in times {
                sum += (midTime / time)
            }
            
            if sum < n {
                minTime = midTime + 1
            } else /*sum이 target과 같거나 크다.*/ {
                maxTime = midTime - 1
                result = midTime
            }
        }
        return result
    }
}
