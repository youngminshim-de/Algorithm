//
//  main.swift
//  Programmers
//
//  Created by 심영민 on 2021/07/05.
//

import Foundation

func solution(_ numbers: [Int]) -> String {
    let sorted: [Int] = numbers.sorted{ Int("\($0)\($1)")! > Int("\($1)\($0)")! }
    if sorted[0] == 0 {
        return "0"
    }
    return sorted.reduce(""){ $0+"\($1)" }
}

//print(solution([6,10,2]))
//print(solution([3, 30, 34, 5, 9]))
//print(solution([3, 1000, 34, 5, 9]))
//
//print(Sort.selectedSort([3, 1000, 34, 5, 9]))
//print(Sort.insertionSort([3, 1000, 34, 5, 9]))
//print(Sort.bubbleSort([3, 1000, 34, 5, 9]))

//print(RomanToInteger.romanToInt("III"))
print(Printer.solution2([2,1,3,2], 2))
