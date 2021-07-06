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
        tempArray = Sort.selectedSort(tempArray)
        result.append(tempArray[k])
    }
    return result
}

class Sort {
    static func bubbleSort(_ array: [Int]) -> [Int] {
        var sortedArray = array
        for i in 0..<array.count-1 {
            for j in i+1..<array.count {
                if sortedArray[i] > sortedArray[j] {
                    sortedArray.swapAt(i, j)
                }
            }
        }
        return sortedArray
    }

    static func selectedSort(_ array: [Int]) -> [Int] {
        var sortedArray = array
        for i in 0..<sortedArray.count-1 {
            var temp = i
            for j in i+1..<sortedArray.count {
                if sortedArray[temp] > sortedArray[j] {
                    // 최솟값을 찾는 과정
                    temp = j
                }
            }
            sortedArray.swapAt(i, temp)
        }
        return sortedArray
    }
    
    static func insertionSort(_ array: [Int]) -> [Int] {
        var sortedArray = array
        for i in 1..<sortedArray.count {
            for j in stride(from: i, to: 0, by: -1) {
                if sortedArray[j] < sortedArray[j-1] {
                    sortedArray.swapAt(j, j-1)
                } else {
                    break
                }
            }
        }
        return sortedArray
    }
}


