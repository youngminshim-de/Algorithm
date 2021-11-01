//
//  Car_Problem2.swift
//  Programmers
//
//  Created by 심영민 on 2021/10/28.
//

import Foundation

class Car_Problem2 {
    static func solution(_ n: Int) -> Int {

        // 1자릿수 9 = 1 * 9
        // 2자릿수 180 = 2 * 90
        // 3자릿수 2700 = 3 * 900
        // 규칙 : 자릿수 * 9 * 10^(자릿수-1)
        // ex) 2자릿수를 뽑는 경우의 수 = 9 * 10 = 90개
        // 하지만 11은 1,1 두개의 숫자로 표현되므로 *2 를 하여 180개가 된다.
        
        var figure = 1
        var multiplier = 9
        
        // 최대숫자 즉, 2자리 수일 경우 99, 3자리 수일 경우 999
        var maxNum = 9
        
        // 숫자를 카운트하기 위한 sum
        // 1자릿수 9 + 2자릿수 180 = 189
        // 190부터 3자릿수가 등장한다.
        var sum = figure * multiplier
        
        // 몇 자리수인지를 찾는 과정
        while sum < n {
            multiplier *= 10
            figure += 1
            maxNum = (maxNum * 10) + 9
            sum += multiplier * figure
        }
        
        // 숫자를 찾는 과정
        var num = maxNum - ( (sum - n) / figure )
        
        // ( (sum - n) % figure ) 는 num에서 몇번째 숫자인지를 찾는 과정
        for _ in 0..<((sum - n) % figure) {
            num /= 10
        }
        
        return num % 10
        
        // 몇째 자릿수인지 카운트한다.
        // n번째 숫자가 몇인지 알아낸다.
        // 숫자의 몇번째가 n번째인지 알아낸다.
    }
}
