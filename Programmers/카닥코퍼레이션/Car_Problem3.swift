//
//  Car_Problem3.swift
//  Programmers
//
//  Created by 심영민 on 2021/10/28.
//

import Foundation

class Car_Problem3 {
    static func solution(_ n: Int) -> Int {

        var array: [Int] = []
        array.append(1)
        var index = 2
        // 2^n 개씩 늘어난다.
        var count = 1
        var indexOfAdd = 0
        while array.count < n {
            // 2 ^ n 번째는 3의 배수가 들어가야 한다.
            // index는 2의 제곱만큼 늘어난다.
            
            if index - 1 == array.count {
                count *= 3
                array.append(count)
                index *= 2
                indexOfAdd = 0
                
            } else {
                // 2^n번째가 아닐경우 현재 count에다가
                // array[0]~array[index-1] 까지 더한다.
                array.append(count + array[indexOfAdd])
                indexOfAdd += 1
            }
        }
        
        return array.last!
    }
}
