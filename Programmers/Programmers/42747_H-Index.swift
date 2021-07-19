//
//  42747_H-Index.swift
//  Programmers
//
//  Created by 심영민 on 2021/07/19.
//

import Foundation
class HIndex {
    static func solution(_ citations:[Int]) -> Int {
        let sortedCitations = citations.sorted(by:>)
        for i in 0..<sortedCitations.count {
            
            if i >= sortedCitations[i] {
               return i
            }
        }
        return sortedCitations.count
    }
}
