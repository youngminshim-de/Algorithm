//
//  876_MiddleOfLinkedList.swift
//  Programmers
//
//  Created by 심영민 on 2021/09/02.
//

import Foundation

class MiddleOfLinkedList {
    static func middleNode(_ head: ListNode?) -> ListNode? {

        var walker = head
        var runner = head
        
        while runner?.next != nil {
            walker = walker?.next
            runner = runner?.next?.next
        }
        
        return walker
    }
}
