//
//  2003_SumOfNumber_TwoPointer.swift
//  Programmers
//
//  Created by 심영민 on 2021/07/13.
//

import Foundation

func solution() {
    let input = readLine()!.components(separatedBy: " ").map{ Int($0)! }
    let N = input[0]
    let M = input[1]
    
    let array = readLine()!.components(separatedBy: " ").map{ Int($0)! }
    
    var partialSum = array.first!
    var start = 0
    var end = 0
    var count = 0
    
    while end < N {
        if partialSum > M {
            partialSum -= array[start]
            start += 1
            
        } else if partialSum < M {
            end += 1
            if end == N {
                break
            }
            partialSum += array[end]
            
        } else {
            partialSum -= array[start]
            start += 1
            count += 1
        }
    }
    print(count)
}
