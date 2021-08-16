//
//  11_ContainerWithMostWater.swift
//  Programmers
//
//  Created by 심영민 on 2021/08/16.
//

import Foundation

class ContainerWithMostWater {
    static func maxArea(_ height: [Int]) -> Int {
        var result = 0
        var leftIndex = 0
        var rightIndex = height.count - 1
        
        while leftIndex < rightIndex {
            let width = rightIndex - leftIndex
            let area = width * min(height[leftIndex], height[rightIndex])
            result = max(result, area)
            
            if height[leftIndex] > height[rightIndex] {
                rightIndex -= 1
            } else {
                leftIndex += 1
            }
        }
        return result
    }
}
