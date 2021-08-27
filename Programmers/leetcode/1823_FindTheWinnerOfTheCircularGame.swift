//
//  1823_FindTheWinnerOfTheCircularGame.swift
//  Programmers
//
//  Created by 심영민 on 2021/08/26.
//

import Foundation

class WinnerOfTheCircularGame {
    static func findTheWinner(_ n: Int, _ k: Int) -> Int {
        var queue = [Int]()
        
        for i in 1...n {
            queue.append(i)
        }
        var index = 0
        while queue.count > 1 {
            index += (k - 1)
            index = index % queue.count
            queue.remove(at: index)
        }
        return queue[0]
    }
}
