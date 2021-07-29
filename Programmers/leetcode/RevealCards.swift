//
//  RevealCards.swift
//  Programmers
//
//  Created by 심영민 on 2021/07/29.
//

import Foundation

class Cards {
    static func deckRevealedIncreasing(_ deck: [Int]) -> [Int] {
        var sortedDeck = deck.sorted(by: >)
        var result = [Int]()
        
        for _ in 0..<sortedDeck.count {
            if result.count == 0 {
                result.append(sortedDeck.removeFirst())
            } else {
                let last = result.removeLast()
                result.insert(last, at: 0)
                result.insert(sortedDeck.removeFirst(), at: 0)
            }
        }
        return result
    }
}
