//
//  509_FibonacciNumber.swift
//  Programmers
//
//  Created by 심영민 on 2021/08/31.
//

import Foundation

class FibonacciNumber {
    static func fib(_ n: Int) -> Int {
        guard n > 1 else {
            return n
        }
        
        return fib(n-1) + fib(n-2)
    }
}
