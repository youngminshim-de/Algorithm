//
//  373_FindKPairs.swift
//  Programmers
//
//  Created by 심영민 on 2021/08/05.
//

import Foundation

class FindKPairs {
    static func kSmallestPairs(_ nums1: [Int], _ nums2: [Int], _ k: Int) -> [[Int]] {
        var array: [[Int]] = []
        for num1 in nums1 {
            for num2 in nums2 {
                array.append([num1,num2])
            }
        }
        let sortedArray = array.sorted(by: { (array1, array2) in
            return (array1[0] + array1[1]) < (array2[0] + array2[1])
        })
        
        if sortedArray.count < k {
            return sortedArray
        }
        var result: [[Int]] = []
        
        for i in 0..<k {
            result.append(sortedArray[i])
        }
        return result
    }
    
    static func kSmallestPairs2(_ nums1: [Int], _ nums2: [Int], _ k: Int) -> [[Int]] {
        var array = [[Int]]()
        var result = [[Int]]()
        
        // .1 은 sum을 의미하고 오름차순으로 정렬한다.
        var heap: Heap<([Int], Int)> = Heap { (first, second) -> Bool in
            return first.1 < second.1
        }
        
        for num1 in nums1 {
            for num2 in nums2 {
                array.append([num1, num2])
            }
        }
        
        for item in array {
            heap.enqueue((item, item[0] + item[1]))
        }
        
        for _ in 0..<k {
            if let item = heap.dequeue()?.0 {
                result.append(item)
            }
        }
        return result
    }
    
    static func kSmallestPairs3(_ nums1: [Int], _ nums2: [Int], _ k: Int) -> [[Int]] {
        var result = [[Int]]()
               
       if nums1.isEmpty || nums2.isEmpty {
           return []
       }
       
       var queue = PriorityQueue()
       for i in 0..<nums1.count {
        let pair = Pair(nums1[i], nums2[0], 0)
           queue.insert(pair)
       }
       
       var k = k
       while k > 0 && !queue.isEmpty {
           k -= 1
           let current = queue.pop()
           result.append([current.left, current.right])
           if current.index == nums2.count - 1 {continue}
           queue.insert(Pair(current.left, nums2[current.index + 1], current.index + 1))
       }
       
       return result
    }
}

struct Pair {
    var left: Int
    var right: Int
    var index: Int
    var sum: Int
    
    init(_ left: Int, _ right: Int, _ index: Int) {
        self.left = left
        self.right = right
        self.index = index
        self.sum = left + right
    }
}

struct PriorityQueue {
    private var array = [Pair]()
    
    var arrayLog: [[Int]] {
        return array.map({ [$0.left, $0.right, $0.index] })
    }
    
    var pull: Pair? {
        return array.first
    }
    
    var isEmpty: Bool {
        return array.isEmpty
    }
    
    mutating func pop() -> Pair {
        swap(0, array.index(before: array.endIndex))
        let last = array.removeLast()
        heapifyDown(0)
        return last
    }
    
    mutating func insert(_ pair: Pair) {
        array.append(pair)
        heapifyUp(array.count - 1)
    }
    
    mutating func heapifyUp(_ index: Int) {
        if index == 0 {
            return
        }

        if array[parentIndex(index)].sum > array[index].sum {
            swap(parentIndex(index), index)
            heapifyUp(parentIndex(index))
        }
    }
    
    mutating func heapifyDown(_ index: Int) {
        if index >= array.count {
            return
        }
        
        let leftChildIndex = leftChildIndex(index)
        let rightChildIndex = rightChildIndex(index)
        
        if rightChildIndex < array.count {
            if array[leftChildIndex].sum <= array[rightChildIndex].sum
                && array[leftChildIndex].sum < array[index].sum {
                swap(leftChildIndex, index)
                heapifyDown(leftChildIndex)
            } else if array[rightChildIndex].sum < array[index].sum {
                swap(rightChildIndex, index)
                heapifyDown(rightChildIndex)
            }
        } else if leftChildIndex < array.count
                    && array[leftChildIndex].sum < array[index].sum {
            swap(leftChildIndex, index)
            heapifyDown(leftChildIndex)
        }
    }
    
    func parentIndex(_ index: Int) -> Int {
        return (index - 1) / 2
    }
    
    func leftChildIndex(_ index: Int) -> Int {
        return (index * 2) + 1
    }
    
    func rightChildIndex(_ index: Int) -> Int {
        return (index * 2) + 2
    }
    
    mutating func swap(_ leftIndex: Int, _ rightIndex: Int) {
        array.swapAt(leftIndex, rightIndex)
    }
}

struct Heap<Element> {
    var elements: [Element]
    let priorityFunction: (Element, Element) -> Bool
    
    init(elements: [Element] = [], priorityFunction: @escaping (Element, Element) -> Bool) {
        self.elements = elements
        self.priorityFunction = priorityFunction
    }
    
    mutating func buildHeap() {
        for index in (0..<count / 2).reversed() {
            siftDown(elementAtIndex: index)
        }
    }
    
    var isEmpty: Bool {
        return elements.isEmpty
    }
    
    var count: Int {
        elements.count
    }
    
    func peek() -> Element? {
        return elements.first
    }
    
    func isRoot(_ index: Int) -> Bool {
        return (index==0)
    }
    
    func leftChildIndex(of index: Int) -> Int {
        return (index * 2) + 1
    }
    
    func rightChildIndex(of index: Int) -> Int {
        return (index * 2) + 2
    }
    
    func parentIndex(of index: Int) -> Int {
        return (index - 1) / 2
    }
    
    func isHigherPriority(at firstIndex: Int, than secondIndex: Int) -> Bool {
        return priorityFunction(elements[firstIndex], elements[secondIndex])
    }
    
    func highestPriorityIndex(of parentIndex: Int, and childIndex: Int) -> Int {
        guard childIndex < count && isHigherPriority(at: childIndex, than: parentIndex) else {
            return parentIndex
        }
        return childIndex
    }
    
    func highestPriorityIndex(for parent: Int) -> Int {
        return highestPriorityIndex(of: highestPriorityIndex(of: parent, and: leftChildIndex(of: parent)), and: rightChildIndex(of: parent))
    }
    
    mutating func swapElement(at firstIndex: Int, with secondIndex: Int) {
        guard firstIndex != secondIndex else {
            return
        }
        elements.swapAt(firstIndex, secondIndex)
    }
    
    mutating func enqueue(_ element: Element) {
        elements.append(element)
        siftUp(elementAtIndex: count - 1)
    }
    
    mutating func siftUp(elementAtIndex index: Int) {
        let parent = parentIndex(of: index)
        guard !isRoot(index), isHigherPriority(at: index, than: parent) else {
            return
        }
        swapElement(at: index, with: parent)
        siftUp(elementAtIndex: parent)
    }
    
    mutating func dequeue() -> Element? {
        guard !isEmpty else {
            return nil
        }
        // 트리의 마지막 원소와 root의 원소를 바꾼다.
        swapElement(at: 0, with: count-1)
        // 원래 root의 원소를 지워준다. (지금은 트리의 마지막에 가있다.)
        let element = elements.removeLast()
        if !isEmpty {
            siftDown(elementAtIndex: 0)
        }
        return element
    }
    
    mutating func siftDown(elementAtIndex index: Int) {
        let childIndex = highestPriorityIndex(for: index)
        if index == childIndex {
            return
        }
        swapElement(at: childIndex, with: index)
        siftDown(elementAtIndex: childIndex)
    }
}
