//
//  TennisTournament.swift
//  Programmers
//
//  Created by 심영민 on 2021/09/16.
//

import Foundation

class TennisTournament {
    static func solution(_ P: Int, _ C: Int) -> Int {
//        let canPlayGame = P / 2
//
//        if canPlayGame >= C {
//            return C
//        } else {
//            return canPlayGame
//        }
        return (P/2) >= C ? C : (P/2)
    }
}
