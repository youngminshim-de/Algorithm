//
//  9237_InvitationVillageHead.swift
//  Programmers
//
//  Created by 심영민 on 2021/07/05.
//

import Foundation

func solution2() -> Int {
    let numberOfTree = Int(readLine()!)!
    let grownTime = readLine()!.components(separatedBy: " ").map{Int($0)!}
    var sortedGrownTime = grownTime.sorted(by: >)
    
    for day in 1...numberOfTree {
        sortedGrownTime[day-1] += day
    }
    
    let result = sortedGrownTime.max()! + 1
    return result
}
