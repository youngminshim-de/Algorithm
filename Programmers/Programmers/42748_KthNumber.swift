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
    
    static func mergeSort(_ array: [Int]) -> [Int] {
        if array.count <= 1 {
            return array
        }
        let center = array.count / 2
        let left = Array(array[0..<center])
        let right = Array(array[center..<array.count])
        
        func merge(_ left: [Int], _ right: [Int]) -> [Int] {
            var left = left
            var right = right
            var result: [Int] = []
            
            while !left.isEmpty && !right.isEmpty {
                if left[0] < right[0] {
                    result.append(left.removeFirst())
                } else {
                    result.append(right.removeFirst())
                }
            }
            if !left.isEmpty {
                result.append(contentsOf: left)
            }
            
            if !right.isEmpty {
                result.append(contentsOf: right)
            }
            return result
        }
        return merge(mergeSort(left), mergeSort(right))
    }
    
    static func quickSort(_ array: [Int]) -> [Int] {
        // 배열이 비어있거나, 하나만 있는 경우는 이미 정렬되어있는 상태
        guard let start = array.first, array.count > 1 else {
            return array
        }
        
        let key = start // pivot! 보통 첫번째 원소를 기준으로 잡는다.
        let left = array.filter { $0 < key } // 피봇을 기준으로 같거나 작은 수들을 left에 담는다. [Int]
        let right = array.filter{ $0 > key } // 피봇을 기준으로 같거나 큰 수들을 right에 담는다.
        
        return quickSort(left) + [key] + quickSort(right) // 위의 과정을 반복한다.
    }
}


