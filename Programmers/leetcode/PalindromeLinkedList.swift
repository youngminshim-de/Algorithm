//
//  PalindromeLinkedList.swift
//  Programmers
//
//  Created by 심영민 on 2021/07/28.
//

import Foundation

class Palindrome {
    // solution 1
//    static func isPalindrome(_ head: ListNode?) -> Bool {
//
//        guard let head = head else {
//            return false
//        }
//
//        let array = makeArray(head)
//        var index = 0
//        for i in array.reversed() {
//            if i != array[index] {
//                return false
//            }
//            index += 1
//        }
//        return true
//    }
//
//    static func makeArray(_ head: ListNode) -> [Int] {
//        var result = [Int]()
//        var node = head
//
//        while true {
//            result.append(node.val)
//            if let next = node.next {
//                node = next
//            } else {
//                break
//            }
//        }
//        return result
//    }
    
    // solution2
    static func isPalindrome(_ head: ListNode?) -> Bool {
        var fastNode = head
        var slowNode = head
        
        while fastNode?.next != nil && fastNode?.next?.next != nil {
            fastNode = fastNode?.next?.next
            slowNode = slowNode?.next
        }
        
        fastNode = head
        slowNode = reverseNode(slowNode)
        
        while slowNode?.next != nil {
            if slowNode?.val != fastNode?.val {
                return false
            }
            fastNode = fastNode?.next
            slowNode = slowNode?.next
            
        }
        return true
    }
    
    static func reverseNode(_ head: ListNode?) -> ListNode? {
        var previousNode: ListNode?
        var currentNode = head
        var nextNode = head
        
        while currentNode != nil {
            nextNode = currentNode?.next
            currentNode?.next = previousNode
            previousNode = currentNode
            currentNode = nextNode
        }
        return previousNode
    }
}
