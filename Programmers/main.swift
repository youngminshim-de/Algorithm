//
//  main.swift
//  Programmers
//
//  Created by 심영민 on 2021/07/05.
//

import Foundation


let orders = ["ABCFG", "AC", "CDE", "ACDE", "BCFG", "ACDEH"]
let orders2 = ["XYZ", "XWY", "WXA"]

let test = MenuRenewal()

print(test.solution(orders, [2,3,4]))
print(test.solution(["ABCDE", "AB", "CD", "ADE", "XYZ", "XYZ", "ACD"], [2,3,5]))
print(test.solution(orders2, [2,3,4]))
