//
//  PathSum.swift
//  Programmers
//
//  Created by 심영민 on 2021/08/06.
//

import Foundation

class PathSum {
    static func hasPathSum(_ root: TreeNode?, _ targetSum: Int) -> Bool {
        guard let root = root else {
            return false
        }
        
        if root.val == targetSum && root.left == nil && root.right == nil {
            return true
        } else {
            let leftSubTree = hasPathSum(root.left, targetSum - root.val)
            let rightSubTree = hasPathSum(root.right, targetSum - root.val)
            
            return leftSubTree || rightSubTree
        }
    }
}

class PathSum2 {
    static func pathSum(_ root: TreeNode?, _ targetSum: Int) -> [[Int]] {
        var result = [[Int]]()
        
        func dfs(_ root: TreeNode?, _ targetSum: Int, _ array: [Int]) {
            
            guard let root = root else {
                return
            }
            var subArray = array
            
            subArray.append(root.val)
            
            if root.val == targetSum && root.left == nil && root.right == nil {
                result.append(subArray)
                return
            } else {
                dfs(root.left, targetSum - root.val, subArray)
                dfs(root.right, targetSum - root.val, subArray)
            }
        }
        
        dfs(root, targetSum, [])
        
        return result
    }
}
