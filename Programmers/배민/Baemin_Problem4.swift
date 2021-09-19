//
//  Baemin_Problem4.swift
//  Programmers
//
//  Created by 심영민 on 2021/09/19.
//

import Foundation

class Baemin4 {
    // 주어진 코드
    static func solution(_ A: inout [Int], _ B: inout [Int]) -> Int {
        let n: Int = A.count
        let m: Int = B.count
        A.sort()
        B.sort()
        var k: Int = 0
        var i: Int = 0
        while k < n {
          if i < m - 1 && B[i] < A[k] {
            i += 1
          }
          if A[k] == B[i] {
            return A[k]
          }
          k += 1
        }
        return -1
      }
    // 제출한 코드
    static func mySolution(_ A: inout [Int], _ B: inout [Int]) -> Int {
        let n: Int = A.count
        let m: Int = B.count
        A.sort()
        B.sort()
        var k: Int = 0
        var i: Int = 0
        while k < n {
            // B[i] >= A[k] 일 때 까지 i 증가시킨다.
          while i < m - 1 && B[i] < A[k] {
            i += 1
          }
          if A[k] == B[i] {
            return A[k]
          }
          k += 1
        }
        return -1
    }
    
    static func mySolution2(_ A: inout [Int], _ B: inout [Int]) -> Int {
        let n: Int = A.count
        let m: Int = B.count
        A.sort()
        B.sort()
        var k: Int = 0
        var i: Int = 0
        while k < n {
          if i < m - 1 && B[i] < A[k] {
            i += 1
          }
          if A[k] == B[i] {
            return A[k]
          }
            // while문과 비교했을 때, 비교를 한번 더 해야한다.
            // 한 칸씩 움직이기에, 비교횟수가 while문을 사용할 때 보다 많다.
          if i == m - 1 || B[i] > A[k] {
            k += 1
          }
        }
        return -1
    }
}
