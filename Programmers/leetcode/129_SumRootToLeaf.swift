//
//  129_SumRootToLeaf.swift
//  Programmers
//
//  Created by 심영민 on 2021/07/22.
//

import Foundation

class TreeNode {
    var val: Int
    var left: TreeNode?
    var right: TreeNode?
    
    init() {
        self.val = 0
        self.left = nil
        self.right = nil
    }
    init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
    
    init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

class SumRootToLeaf {
    static func sumNumbers(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        var stack = [(root, 0)]
        var result = 0
        
        while !stack.isEmpty {
            let (node, val) = stack.popLast()!
            // 하위 노드로 내려갈때 마다 10씩 곱해주고 val을 더해준다.
            // 1 -> 2 -> 3
            // 0 * 10 + 1 = 1
            // 1 * 10 + 2 = 12
            // 12 * 10 + 3 = 123
            let sumVal = val * 10 + node.val
            
            // 마지막 노드라면 result값에 sumVal를 더한다.
            if node.left == nil && node.right == nil {
                result += sumVal
            } else {
                // 왼쪽 노드를 stack에 추가해준다.
                if let left = node.left {
                    stack.append((left,sumVal))
                }
                // 오른쪽 노드 또한 stack에 추가해준다.
                // 같은 sumVal를 넘겨줌으로써 같은 level로 만들어준다.
                if let right = node.right {
                    stack.append((right,sumVal))
                }
            }
        }
        return result
    }
}
