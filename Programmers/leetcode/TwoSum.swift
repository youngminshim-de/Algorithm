//
//  TwoSum.swift
//  Programmers
//
//  Created by 심영민 on 2021/07/05.
//

import Foundation

// O(n^2)
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

// O(n)
//func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
//    var dict: [Int:Int] = [:]
//    for i in 0...nums.count - 1 {
//        let difference = target - nums[i]
//        if let key = dict[difference] {
//            return [i, key]
//        }
//        dict[nums[i]] = i
//    }
//    return [Int]()
//}
