//
//  File.swift
//  Programmers
//
//  Created by 심영민 on 2021/11/01.
//

import Foundation

class Z {
    static func solution() {
        // base condition n= 1
        // 왼쪽위칸 -> 오른쪽위칸 -> 왼쪽아래칸 -> 오른쪽아래칸
        let input = readLine()!.components(separatedBy: " ").map{Int($0)!}
        let n = input[0]
        let row = input[1]
        let column = input[2]
        
        func recursive(_ row: Int, _ column: Int, _ count: Int) -> Int {
            guard count != 0 else {
                return 0
            }
            let half = 1<<(count-1)
            
            // 왼쪽 위칸
            if row < half && column < half {
                return recursive(row, column, count-1)
            }
            // 오른쪽 위칸
            if row < half && column >= half {
                return half * half + recursive(row, column-half, count-1)
            }
            // 왼쪽 아래칸
            if row >= half && column < half {
                return 2 * half * half + recursive(row-half, column, count-1)
            }
            // 오른쪽 아래칸
            return 3 * half * half + recursive(row-half, column-half, count-1)
        }
        
        print(recursive(row, column, n))
    }
}
