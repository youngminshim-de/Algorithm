//
//  104_MaximumDepth.swift
//  Programmers
//
//  Created by 심영민 on 2021/08/07.
//

import Foundation

class MaximumDepth {
    func maxDepth(_ root: TreeNode?) -> Int {
        var maximum = 0
        
        func dfs(_ root: TreeNode?, _ depth: Int) {
            guard let root = root else {
                maximum = max(maximum, depth)
                return
            }
            if root.left == nil && root.right == nil {
                maximum = max(maximum, depth+1)
                return
            } else {
                dfs(root.left, depth + 1)
                dfs(root.right, depth + 1)
            }
        }
        dfs(root, 0)
        
        return maximum
    }
    
    func maxDepth2(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        
        let left = maxDepth(root.left)
        let right = maxDepth(root.right)
        
        return max(left, right) + 1
    }
}
