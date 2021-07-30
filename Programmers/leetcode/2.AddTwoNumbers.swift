//
//  2.AddTwoNumbers.swift
//  Programmers
//
//  Created by 심영민 on 2021/07/30.
//

import Foundation

class TwoNumbers {
    static func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var currentNode1 = l1
        var currentNode2 = l2
        let dummy = ListNode()
        var result = dummy
        while true {
            let value = (currentNode1!.val + currentNode2!.val)
            if currentNode1?.next == nil && currentNode2?.next == nil {
                result.next = ListNode(value % 10)
                if value >= 10 {
                    result.next?.next = ListNode(1)
                }
                
                return dummy.next
            } else {
                result.next = ListNode(value % 10)
                currentNode1 = currentNode1?.next == nil ? ListNode(0) : currentNode1?.next
                currentNode2 = currentNode2?.next == nil ? ListNode(0) : currentNode2?.next
                if value >= 10 {
                    currentNode1?.val += 1
                }
                result = result.next!
            }
        }
    }
}
