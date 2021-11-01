//
//  11729_HanoiTower.swift
//  Programmers
//
//  Created by 심영민 on 2021/11/01.
//

import Foundation

class HanoiTower {
    static func solution() {
        let input = readLine()!
        guard let count = Int(input) else {
            return
        }
        
        func recursive(_ a: Int, _ b: Int, _ count: Int) {
            guard count != 1 else {
                print("\(a) \(b)")
                return
            }
            
            recursive(a, 6-a-b, count-1)
            print("\(a) \(b)")
            recursive(6-a-b, b, count-1)
        }
        // << left shift 2의 제곱만큼 커진다. *2.  1<<5 = 2^5
        // >> right shift 2의 제곱만큼 작아진다. /2
        print( (1<<count)-1)
//        print(Int(pow(Double(2), Double(count))) - 1)
        recursive(1, 3, count)
    }
}
