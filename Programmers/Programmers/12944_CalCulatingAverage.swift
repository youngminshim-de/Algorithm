//
//  12944_CalCulatingAverage.swift
//  Programmers
//
//  Created by 심영민 on 2021/07/05.
//

import Foundation

func calculateAverage(_ arr: [Int]) -> Double {
    var sum = arr.reduce(0, +)
    return Double(sum) / Double(arr.count+1)
}
