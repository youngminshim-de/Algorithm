//
//  347_TopKFrequentElements.swift
//  Programmers
//
//  Created by 심영민 on 2021/08/12.
//

import Foundation

class TopKFrequent {
    static func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        var result = Array<Int>()
        
        let numDictionary = nums.reduce(into: [:]) { (counts, num) in
            counts[num, default: 0] += 1
        }
        
        let sorted = numDictionary.sorted(by: {$0.value > $1.value})

        for i in 0..<k {
            result.append(sorted[i].key)
        }
        
        return result
    }
}
