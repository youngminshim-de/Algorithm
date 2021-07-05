//
//  TwoSum.swift
//  Programmers
//
//  Created by 심영민 on 2021/07/05.
//

import Foundation

func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    var answer: [Int] = []
    for i in 0..<nums.count-1 {
        for j in i+1..<nums.count {
            if nums[i] + nums[j] == target {
                answer.append(j)
                answer.append(i)
                break
            }
        }
    }
    return answer
}
