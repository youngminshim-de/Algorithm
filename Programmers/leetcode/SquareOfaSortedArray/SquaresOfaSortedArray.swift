//
//  SquaresOfaSortedArray.swift
//  Programmers
//
//  Created by 심영민 on 2021/08/30.
//

import Foundation

class SquaresSortedArray {
    static func sortedSquares(_ nums: [Int]) -> [Int] {
        return nums.map{ Int(pow(Double($0), 2)) }.sorted(by: <)
    }
}
