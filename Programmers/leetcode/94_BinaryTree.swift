//
//  94_BinaryTree.swift
//  Programmers
//
//  Created by 심영민 on 2021/08/06.
//

import Foundation

class BinaryTree {
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        
        var result: [Int] = []
        
        func dfs(_ root: TreeNode?, _ result: inout [Int]) {
            guard let root = root else {
                return
            }
            
            dfs(root.left, &result)
            result.append(root.val)
            dfs(root.right, &result)
        }
        dfs(root, &result)
        return result
    }
}
