//
//  KthNumber.swift
//  Programmers
//
//  Created by 심영민 on 2021/07/05.
//

import Foundation

func solution(_ array: [Int], _ commands: [[Int]]) -> [Int] {
    var result: [Int] = []
    for index in 0..<commands.count {
        let i = commands[index][0] - 1
        let j = commands[index][1] - 1
        let k = commands[index][2] - 1
        var tempArray = array[i...j].map({$0})
        tempArray = selectedSorted(tempArray)
        result.append(tempArray[k])
    }
    return result
}

func selectedSorted(_ array: [Int]) -> [Int] {
    var sortedArray = array
    for i in 0..<array.count-1 {
        for j in i+1..<array.count {
            if sortedArray[i] > sortedArray[j] {
                let temp = sortedArray[i]
                sortedArray[i] = sortedArray[j]
                sortedArray[j] = temp
            }
        }
    }
    return sortedArray
}
