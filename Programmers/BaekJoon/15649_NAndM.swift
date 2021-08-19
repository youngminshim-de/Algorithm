//
//  15649_NAndM.swift
//  Programmers
//
//  Created by 심영민 on 2021/08/19.
//

import Foundation

class NAndM {
    static func solution() {
        let input = readLine()!.components(separatedBy: " ").map{Int($0)!}
        
        let n = input[0]
        let m = input[1]
        
        var array = [Int]()
        var checkList = Array<Int>(repeating: 0, count: n)
        for i in 1...n {
            array.append(i)
        }
        print("순열")
        dfs(0, m, "")
        print("조합")
        dfs2(0, 0, m, "")
        
        // 순열 ( 순서가 있다.)
        func dfs(_ currentCount: Int, _ targetCount: Int, _ answer: String) {
            if currentCount == targetCount {
                print(answer)
                return
            }
            
            for i in 0..<array.count {
                if checkList[i] == 0 {
                    checkList[i] = 1
                    dfs(currentCount + 1, targetCount, (answer + "\(array[i]) "))
                    checkList[i] = 0
                }
            }
        }
        // 조합 ( 순서가 없다.)
        func dfs2(_ currentIndex: Int, _ currnetCount: Int, _ targetCount: Int, _ answer: String) {
            if currnetCount == targetCount {
                print(answer)
                return
            }
            // 현재 index 부터 for문을 돈다. 중복을 제거 하기 위해
            // currentIndex: 0 -> 1, 2, 3, 4
            // currentIndex: 1 -> 2, 3, 4
            // currnetIndex: 2 -> 3, 4
            // currentIndex: 3 -> 4
            for i in currentIndex..<array.count {
                if checkList[i] == 0 {
                    checkList[i] = 1
                    dfs2(i, currnetCount+1, targetCount, (answer + "\(array[i]) "))
                    checkList[i] = 0
                }
            }
        }
    }
}
