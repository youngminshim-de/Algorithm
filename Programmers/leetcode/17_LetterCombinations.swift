//
//  File.swift
//  Programmers
//
//  Created by 심영민 on 2021/08/06.
//

import Foundation

class Letter {
    static let letterDictionary: [Int: [String]] = [ 2 : ["a", "b", "c"],
                                                 3 : ["d", "e", "f"],
                                                 4 : ["g", "h", "i"],
                                                 5 : ["j", "k", "l"],
                                                 6 : ["m","n","o"],
                                                 7 : ["p", "q", "r", "s"],
                                                 8 : ["t", "u", "v"],
                                                 9 : ["w", "x", "y", "z"]]
    
    static func letterCombinations(_ digits: String) -> [String] {
        if digits.count == 0 {
            return []
        }
        let inputArray = digits.map{ Int(String($0))! }
        var result = [String]()
        
        
        func dfs(_ string: String, _ index: Int) {
            // 현재 글자의 길이가 처음입력된 번호의 길이와 같다면 appen 한다.
            // '마지막 숫자'라는 의미 or 마지막 깊이
            if index == inputArray.count {
                result.append(string)
                return
            }
            
            for i in 0..<letterDictionary[inputArray[index]]!.count {
                let next = string + letterDictionary[inputArray[index]]![i]
                dfs(next, index+1)
            }
        }
        
        for i in 0..<letterDictionary[inputArray[0]]!.count {
            dfs(letterDictionary[inputArray[0]]![i], 1)
        }
        return result
    }
}
