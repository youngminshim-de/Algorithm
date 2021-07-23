//
//  main.swift
//  Programmers
//
//  Created by 심영민 on 2021/07/05.
//

import Foundation

print("solution1 : \(HIndex.solution([3,0,6,1,5]))")
print("solution1 : \(HIndex.solution([10, 100]))")
print("solution1 : \(HIndex.solution([2,2,2]))")
print("solution1 : \(HIndex.solution([6,6,6,6,6,6]))")

var root = TreeNode(1, TreeNode(2, TreeNode(4), TreeNode(5)), TreeNode(3, TreeNode(6), nil))
print(SumRootToLeaf.sumNumbers(root))
