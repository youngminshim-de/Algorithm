//
//  MergeTwoSortedLists.swift
//  Programmers
//
//  Created by 심영민 on 2021/07/28.
//

import Foundation


public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}
 
class MergeTwoSortedLists {
    static func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        guard let l1 = l1 else {
            return l2
        }
        guard let l2 = l2 else {
            return l1
        }
        
        let l1Array = makeArray(l1)
        let l2Array = makeArray(l2)
        
        let array = (l1Array + l2Array).sorted(by: <)
        return makeList(array)
    }
    
    static func makeArray(_ l1: ListNode) -> [Int] {
        var result = [Int]()
        var node = l1
        
        while true {
            result.append(node.val)
            if let next = node.next {
                node = next
            } else {
                break
            }
        }
        
        return result
    }
    
    static func makeList(_ array: [Int]) -> ListNode? {
        var result: ListNode? = nil
        var next: ListNode? = nil
        
        for val in array {
            if result == nil {
                result = ListNode(val)
                next = result
            } else {
                next!.next = ListNode(val)
                next = next?.next
                
            }
        }
        return result ?? nil
    }
}
