//
//  RectangleBuilderGreaterArea.swift
//  Programmers
//
//  Created by 심영민 on 2021/09/16.
//

import Foundation

class RectangleBuilderGreaterArea {
    static func solution(_ A : inout [Int], _ X : Int) -> Int {
        var result = 0
        var dict = A.reduce(into: [:]) { (counts, int) in
            counts[int, default: 0] += 1
        }
        
        dict = dict.filter({$0.value > 1})

        for (key, value) in dict.sorted(by: <) {
            for k in dict.keys.sorted(by: <) {
                if key > k {
                    continue
                } else if key == k {
                    if value >= 4 && key * key >= X {
                        result += 1
                    }
                } else {
                    if key * k >= X {
                        result += 1
                    }
                }
            }
        }
        return result > 1000000000 ? -1 : result
    }
    
    static func solution2(_ A : inout [Int], _ X : Int) -> Int {
        var result = 0
        var dict = A.reduce(into: [:]) { (counts, int) in
            counts[int, default: 0] += 1
        }
        
        dict = dict.filter({$0.value > 1})
        let array = dict.keys.sorted(by: <)
        var left = 0
        var right = array.count - 1
        
        while left < right {
            if array[left] * array[right] >= X {
                result += 1
                right -= 1
            } else {
                left += 1
                right = array.count - 1
            }
        }
        
        for (key, value) in dict {
            if value >= 4 && (key * key >= X) {
                result += 1
            }
        }
        
        return result > 1000000000 ? -1 : result
    }
    
    static func solution3(_ A: inout [Int], _ X: Int) -> Int {
        var result = 0
        var dict = A.reduce(into: [:]) { (counts, int) in
            counts[int, default: 0] += 1
        }
        
        dict = dict.filter({$0.value > 1})
        let array = dict.keys.sorted(by: <)
        var left = 0
        var right = array.count - 1
        var mid = 0
        
        for i in 0..<array.count {
            let target = Int(ceil(Double(X) / Double(array[i])))
            left = 0
            right = array.count - 1
            mid = (left + right) / 2
            
            // 내 자신의 곱이 목장 펜스 면적(X) 보다 크다면 내 뒤로는 다 가능하기에 (오름차순 정렬되어있으므로)
            if array[i] * array [i] >= X {
                result += (array.count - i)
                continue
            }
            
            while left < right {
                if array[mid] == target {
                    break
                } else if array[mid] > target {
                    right = mid
                } else if array[mid] < target {
                    left = mid + 1
                }
                mid = (left + right) / 2
            }
            
            if array[mid] >= target  {
                result = result + (array.count - mid)
            }
//            else if array[mid] < target {
//                result = result + (array.count - (mid+1))
//            }
        }
        
        // 위에서 먼저 내 자신의 곱( Ex. 2X2 ) 또한 포함 했으므로, 펜스의 개수가 4개가 안된다면
        // result에서 1을 빼준다.
        for (key, value) in dict {
            if value < 4 && (key * key >= X) {
                result -= 1
            }
        }
        
        return result > 1000000000 ? -1 : result
    }
}
