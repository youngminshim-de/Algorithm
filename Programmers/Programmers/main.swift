//
//  main.swift
//  Programmers
//
//  Created by 심영민 on 2021/07/05.
//

import Foundation

let calendar = [ 1: 31,
                 2: 29,
                 3: 31,
                 4: 30,
                 5: 31,
                 6: 30,
                 7: 31,
                 8: 31,
                 9: 30,
                 10: 31,
                 11: 30,
                 12: 31 ]

let dayArr = ["FRI", "SAT", "SUN", "MON", "TUE", "WED", "THU"]

func solution(_ a: Int, _ b: Int) -> String {
    var days = calendar.filter{ $0.key < a }.reduce(0) {$0 + $1.value} + b-1
    return dayArr[days % 7]
}
