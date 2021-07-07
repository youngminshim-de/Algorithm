//
//  11899_InsertionParenthesis.swift
//  Programmers
//
//  Created by 심영민 on 2021/07/07.
//

import Foundation

func solution(_ str: String) -> Int {
    var tempString = str
    var prevString = tempString
    while true {
        tempString = tempString.replacingOccurrences(of: "()", with: "")
        if tempString == prevString {
            return tempString.count
        }
        prevString = tempString
    }
}
