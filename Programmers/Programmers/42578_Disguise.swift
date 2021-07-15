//
//  42578_Disguise.swift
//  Programmers
//
//  Created by 심영민 on 2021/07/14.
//

import Foundation

class Disguise {
    static func solution(_ clothes:[[String]]) -> Int {
        var dictionary = [String: Int]()
        var result = 1
        
        for i in 0..<clothes.count {
            let kindOfClothes = clothes[i][1]
            if dictionary[kindOfClothes] == nil {
                dictionary[kindOfClothes] = 1
            } else {
                dictionary[kindOfClothes]! += 1
            }
        }
        
        for (_, value) in dictionary {
            result *= value+1
        }

        return result - 1
    }
    
    static func solution2(_ clothes:[[String]]) -> Int {
        let types = clothes.compactMap({ $0.last })
        let typeSet = Set(types)
        let categories = Array(typeSet)
        
        let counts = typeSet.map({ category in
            return clothes.filter({ $0.last == category}).count + 1
        })
        
        return counts.reduce(1, {$0 * $1}) - 1
    }
}
