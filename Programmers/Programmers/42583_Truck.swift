//
//  42583_Truck.swift
//  Programmers
//
//  Created by 심영민 on 2021/07/15.
//

import Foundation

class Truck {
    static func solution(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {
        
        var result = bridge_length
        var truck_willcross = truck_weights
        var truck_crossing: [Int] = []
        var totalWeight = 0

        while !truck_willcross.isEmpty {
            let nextTruck = truck_willcross.first!
            
            if totalWeight + nextTruck > weight {
                truck_crossing.append(0)
            } else {
                truck_crossing.append(truck_willcross.removeFirst())
                totalWeight += nextTruck
            }
            
            if truck_crossing.count == bridge_length {
                totalWeight -= truck_crossing.removeFirst()
            }
            result += 1
        }
        return result
    }
}
