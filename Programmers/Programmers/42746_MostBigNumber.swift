//
//  42746_MostBigNumber.swift
//  Programmers
//
//  Created by 심영민 on 2021/07/05.
//

import Foundation

func solution3(_ numbers: [Int]) -> String {
    let sorted: [Int] = numbers.sorted{ Int("\($0)\($1)")! > Int("\($1)\($0)")! }
    if sorted[0] == 0 {
        return "0"
    }
    return sorted.reduce(""){ $0+"\($1)" }
}
