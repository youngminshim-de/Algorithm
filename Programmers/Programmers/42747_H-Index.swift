//
//  42747_H-Index.swift
//  Programmers
//
//  Created by 심영민 on 2021/07/19.
//

import Foundation
class HIndex {
    static func solution(_ citations:[Int]) -> Int {
        
        var sortedCitations = quickSort(citations)
        var index = 0
        
        for i in 0..<sortedCitations.count {
            let countArray = sortedCitations.filter { $0 >= sortedCitations[i] }
            
            if countArray.count == sortedCitations[i] {
               index = max(index,sortedCitations[i])
            }
        }
        return index
    }

    static func quickSort(_ array:[Int]) -> [Int] {
            // 배열이 비어있거나, 하나만 있는 경우는 이미 정렬되어있는 상태
            guard let start = array.first, array.count > 1 else {
                return array
            }
            
            let key = start // pivot! 보통 첫번째 원소를 기준으로 잡는다.
            let left = array.filter { $0 < key } // 피봇을 기준으로 같거나 작은 수들을 left에 담는다. [Int]
            let right = array.filter{ $0 > key } // 피봇을 기준으로 같거나 큰 수들을 right에 담는다.
            
            return quickSort(left) + [key] + quickSort(right) // 위의 과정을 반복한다.
    }
}
