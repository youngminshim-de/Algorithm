//
//  SocksLaundering.swift
//  Programmers
//
//  Created by 심영민 on 2021/09/17.
//

import Foundation

class SocksLaundering {
    static func solution(_ K : Int, _ C : inout [Int], _ D : inout [Int]) -> Int {
        var result = 0
        var cleanSocksArray = C.sorted(by: <)
        var dirtySocksArray = D.sorted(by: <)
        var current = 0
        var next = 1
        
        // 이미 짝이 맞춰진 양말 count
        while next < cleanSocksArray.count {
            if cleanSocksArray[current] == cleanSocksArray[next] {
                cleanSocksArray.remove(at: next)
                cleanSocksArray.remove(at: current)
                result += 1
            } else {
                current = next
                next += 1
            }
        }
        
        var k = K
        
        // 깨끗한 양말과 더러운 양말 짝 맞추기
        for i in 0..<cleanSocksArray.count {
            if k == 0 {
                break
            }
            
            guard let index = dirtySocksArray.firstIndex(of: cleanSocksArray[i]) else {
                continue
            }
            
            dirtySocksArray.remove(at: index)
            result += 1
            k -= 1
        }
        
        current = 0
        next = 1
        
        
        if k < 2 {
            return result
        }
        
        // 세탁을 할 수 있는 양말이 더 있을 때, dirty양말 배열에서 짝을 맞춘다.
        while next < dirtySocksArray.count && k > 1 {
            if dirtySocksArray[current] == dirtySocksArray[next] {
                dirtySocksArray.remove(at: next)
                dirtySocksArray.remove(at: current)
                result += 1
                k -= 2
            } else {
                current = next
                next += 1
            }
        }
        return result
    }
}
