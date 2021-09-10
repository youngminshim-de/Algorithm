//
//  617_MergeTwoBinaryTrees.swift
//  Programmers
//
//  Created by 심영민 on 2021/09/10.
//

import Foundation

class MergeTwoBinaryTrees {
    static func mergeTrees(_ root1: TreeNode?, _ root2: TreeNode?) -> TreeNode? {
        guard root1 != nil || root2 != nil else {
            return nil
        }
        let root = TreeNode((root1?.val ?? 0) + (root2?.val ?? 0))
        root.left = mergeTrees(root1?.left, root2?.left)
        root.right = mergeTrees(root1?.right, root2?.right)
        return root
    }
}
