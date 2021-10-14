//
//  62048_NormalRectangle.swift
//  Programmers
//
//  Created by 심영민 on 2021/10/14.
//

import Foundation

class NormalRectangle {
    static func solution(_ w: Int, _ h: Int) -> Int {
        var answer = 0
//        var multiplier = 0
        var slope = w < h ? Int(ceil(Double(h) / Double(w))) : Int(ceil(Double(w) / Double(h)))
        
        if w < h {
            slope = Int(ceil(Double(h) / Double(w)))
            answer = (w * h) - (w * slope)
        } else {
            slope = Int(ceil(Double(w) / Double(h)))
            answer = (w * h) - (h * slope)
        }
//        if slope > 1.0 {
//            multiplier = Int(ceil(slope))
//            answer = (w * h) - (multiplier * w)
//        } else {
//            multiplier = Int(ceil(1 / slope))
//            answer = (w * h) - (multiplier * h)
//        }
        return answer
    }
    
    static func solution2(_ w: Int, _ h: Int) -> Int {
        var answer = 0
        var maximumCommonDivisor = 0
        
        for i in 1...min(w,h) {
            if w % i == 0 && h % i == 0 {
                maximumCommonDivisor = max(maximumCommonDivisor, i)
            }
        }
        
        answer = (w * h) - (w + h - maximumCommonDivisor)
        return answer
    }
}
