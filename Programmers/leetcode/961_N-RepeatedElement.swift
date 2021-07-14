//
//  961_N-RepeatedElement.swift
//  Programmers
//
//  Created by 심영민 on 2021/07/14.
//

import Foundation

// 2*n size 의 배열이 있다.
// 배열에는 n+1개의 중복되지 않는 원소가 존재한다.
// 하나의 원소는 n번 반복되어 존재한다. ( 총 2*n 개)
// 이 때 반복되는 숫자를 구해라

class RepeatedElement {
    static func repeatedNTimes(_ nums: [Int]) -> Int {
        var ary = Set<Int>()
        for num in nums {
            if !ary.insert(num).inserted {
                return num
            }
        }
        return 0
    }
}
