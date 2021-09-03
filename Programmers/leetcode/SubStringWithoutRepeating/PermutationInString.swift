//
//  PermutationInString.swift
//  Programmers
//
//  Created by 심영민 on 2021/09/03.
//

import Foundation

class PermutationInString {
    static func checkInclusion(_ s1: String, _ s2: String) -> Bool {
        
        if s1.count > s2.count {
            return false
        }
        
        let str1 = s1.map{String($0)}
        let str2 = s2.map{String($0)}
        
        var array1 = Array<Int>(repeating: 0, count: 26)
        
        for value in str1 {
            array1[Int(Character(value).asciiValue!) - 97] += 1
        }
        
        for i in 0...str2.count - str1.count {
            if str1.contains(str2[i]) {
                
                var array2 = Array<Int>(repeating: 0, count: 26)
                
                for value in str2[i..<i + str1.count] {
                    array2[Int(Character(value).asciiValue!) - 97] += 1
                }
                
                if array1 == array2{
                    return true
                }
            }
        }
        return false
        
//        let str1 = s1.map{String($0)}
//        let str2 = s2.map{String($0)}
//        let count1 = str1.count
//        let count2 = str2.count
//
//        var array1 = Array<Int>(repeating: 0, count: 26)
//        for value in str1 {
//            array1[Int(Character(value).asciiValue!) - 97] += 1
//        }
//
//        var current = 0
//
//        while current < count2 {
//            if str1.contains(str2[current]) {
//                if current + count1 > count2 {
//                    return false
//                }
//
//                var array2 = Array<Int>(repeating: 0, count: 26)
//                for value in str2[current..<current+count1] {
//                    array2[Int(Character(value).asciiValue!) - 97] += 1
//                }
//
//                if array1 == array2{
//                    return true
//                }
//            }
//
//            current += 1
//        }
//        return false
    }
}
