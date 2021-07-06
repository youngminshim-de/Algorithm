//
//  RomanToInteger.swift
//  Programmers
//
//  Created by 심영민 on 2021/07/06.
//

import Foundation

let dict: [Character:Int] = [ "I" : 1,
                           "V" : 5,
                           "X" : 10,
                           "L" : 50,
                           "C" : 100,
                           "D" : 500,
                           "M" : 1000]

class RomanToInteger {

    static func romanToInt(_ s: String) -> Int {
        let romanArray = s.map{$0}
        var sum = 0
        
        for i in 0..<romanArray.count - 1 {
            if dict[romanArray[i]]! < dict[romanArray[i+1]]! {
                sum -= dict[romanArray[i]]!
            } else {
                sum += dict[romanArray[i]]!
            }
        }
        sum += dict[romanArray.last!]!
        return sum
    }
    
//    static func romanToInt(_ s: String) -> Int {
//        for i in 0..<romanArray.count - 1 {
//            if romanArray[i] == "I" {
//                if romanArray[i+1] == "V" || romanArray[i+1] == "X" {
//                    sum -= 1
//                } else {
//                    sum += dict[romanArray[i]]!
//                }
//            }
//            else if romanArray[i] == "X" {
//                if romanArray[i+1] == "L" || romanArray[i+1] == "C" {
//                    sum -= 10
//                } else {
//                    sum += dict[romanArray[i]]!
//                }
//            }
//            else if romanArray[i] == "C" {
//                if romanArray[i+1] == "D" || romanArray[i+1] == "M" {
//                    sum -= 100
//                } else {
//                    sum += dict[romanArray[i]]!
//                }
//            }
//            else {
//                sum += dict[romanArray[i]]!
//            }
//        }
//        sum += dict[romanArray.last!]!
//        return sum
//    }
}

// 예외상황 IV 4, IX 9, CM 900, XC 90, XL 40, CD 400
// I - V, X
// X - L, C
// C - D, M
