//
//  42587_Printer.swift
//  Programmers
//
//  Created by 심영민 on 2021/07/06.
//

import Foundation

class Printer {
    func solution(_ priorities:[Int], _ location:Int) -> Int {
        var tempArray = priorities
        var count = 0
        var isPrinted = false
        
        while !isPrinted {
            for i in 1..<tempArray.count {
                if tempArray.first! < tempArray[i] {
                    var currentDocument = tempArray.removeFirst()
                    tempArray.append(currentDocument)
                    count += 1
                    break
                }
            }
        }
        return 0
    }
}

// 일단 맨앞에꺼 꺼낸다.
// 우선순위 뒤쳐져있으면 맨 뒤로 보낸다.
// 우선순위 제일 높은놈이 나왔으면 인쇄한다.
