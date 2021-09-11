//
//  KaKao_Problem3.swift
//  Programmers
//
//  Created by 심영민 on 2021/09/11.
//

import Foundation

class KaKao_Problem3 {
    func solution(_ fees:[Int], _ records:[String]) -> [Int] {
        
        var array: [[String]] = []
        var parkingTimeDictionary: [String: Int] = [:]
        var result: [Int] = []
        
        for record in records {
            let temp = record.components(separatedBy: " ")
            let time = temp[0]
            let carNumber = temp[1]
            let inAndOut = temp[2]
            array.append([carNumber, time, inAndOut])
        }
        
        var checkList = Array(repeating: false, count: array.count)
        
        for i in 0..<array.count {
            for j in i+1..<array.count {
                if array[i][0] == array[j][0] && !checkList[i] && !checkList[j]  {
                    parkingTimeDictionary[array[i][0], default: 0] += calculateMinutes(stringConvertDate(array[i][1]), stringConvertDate(array[j][1]))
                    checkList[i] = true
                    checkList[j] = true
                    break
                }
            }
            if !checkList[i] {

                parkingTimeDictionary[array[i][0], default: 0] += calculateMinutes(stringConvertDate(array[i][1]), stringConvertDate("23:59"))
            }
        }
        
        
        
        for (_, value) in parkingTimeDictionary.sorted(by: <) {
            result.append(calculateFee(fees, value))
        }
                
        return result
    }
    
    func stringConvertDate(_ str: String) -> Date {
        let stringFormat = "HH:mm"
        let formatter = DateFormatter()
        formatter.dateFormat = stringFormat
        
        return formatter.date(from: str)!
    }
    
    func calculateMinutes(_ startTime: Date, _ endTime: Date) -> Int{
        let time = Int(endTime.timeIntervalSince(startTime) / 60)
        return time
    }
    
    func calculateFee(_ fees:[Int], _ intervalTimes: Int) -> Int {
        if intervalTimes <= fees[0] {
            return fees[1]
        } else {
            let fee = fees[1] + ( Int( ceil( Double(intervalTimes - fees[0]) / Double(fees[2]) ) ) * fees[3])
            return fee
        }
    }
}
