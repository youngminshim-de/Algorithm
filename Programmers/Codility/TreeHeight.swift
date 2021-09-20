//
//  TreeHeight.swift
//  Programmers
//
//  Created by 심영민 on 2021/09/20.
//

import Foundation

class Tree {
    var value: Int
    var l: Tree?
    var r: Tree?
    
    init(_ value: Int, _ left: Tree?, _ right: Tree?) {
        self.value = value
        self.l = left
        self.r = right
    }
}

class TreeHeight {
    static func solution(_ T: Tree?) -> Int {
        var leftHeight = 0
        var rightHeight = 0
        
        if T?.l != nil {
            leftHeight = solution(T?.l) + 1
        }
        
        if T?.r != nil {
            rightHeight = solution(T?.r) + 1
        }
        
        return max(leftHeight, rightHeight)
    }
}
