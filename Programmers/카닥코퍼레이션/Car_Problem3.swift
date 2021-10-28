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
            
            if index - 1 == array.count {
                count *= 3
                array.append(count)
                index *= 2
                indexOfAdd = 0
                
            } else {
                array.append(count + array[indexOfAdd])
                indexOfAdd += 1
            }
        }
        
        return array.last!
    }
}
