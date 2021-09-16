//
//  LongestPassword.swift
//  Programmers
//
//  Created by 심영민 on 2021/09/15.
//

import Foundation

class LongestPassword {
    static func solution(_ S: inout String) -> Int {
        var validPassword: [String] = []
        let passwordArray = S.components(separatedBy: " ").map{$0}
        var isValidate: Bool = true
        var letterCount = 0
        var digitCount = 0
        var longestPassword = -1
        
//        let regularExpression = "^[0-9a-zA-Z]*$"
//        var string = "asd#"
//        
//        if let _ = string.range(of: regularExpression, options: .regularExpression) {
//            print("asdasd")
//        }
        
        for password in passwordArray {
            letterCount = 0
            digitCount = 0
            isValidate = true
            
            for char in password {
                if (char >= "A" && char <= "Z") || (char >= "a" && char <= "z") {
                    letterCount += 1
                } else if char >= "0" && char <= "9" {
                    digitCount += 1
                } else {
                    isValidate = false
                    break
                }
            }
            if isValidate && letterCount % 2 == 0 && digitCount % 2 == 1{
                validPassword.append(password)
            }
        }
        
        for password in validPassword {
            longestPassword = max(password.count, longestPassword)
        }
        return longestPassword
    }
    
    static func solution2(_ S: inout String) -> Int {
        var validPassword: [String] = []
        let passwordArray = S.components(separatedBy: " ").map{$0}
        var isValidate: Bool = true
        var letterCount = 0
        var digitCount = 0
        var longestPassword = 0
        
        for password in passwordArray {
            isValidate = true
            letterCount = 0
            digitCount = 0
            for char in password {
                guard let character = char.asciiValue else {
                    isValidate = false
                    break
                }
                if character >= 65 && character <= 122 {
                    letterCount += 1
                } else if character >= 48 && character <= 57 {
                    digitCount += 1
                } else {
                    isValidate = false
                    break
                }
            }
            if isValidate && letterCount % 2 == 0 && digitCount % 2 == 1{
                validPassword.append(password)
            }
        }
        
        for password in validPassword {
            longestPassword = max(password.count, longestPassword)
        }
        print(validPassword)
        return longestPassword
    }
}
