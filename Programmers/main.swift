//
//  main.swift
//  Programmers
//
//  Created by 심영민 on 2021/07/05.
//

import Foundation
print(WordSearch.solution([["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], "ABCCED"))
print(WordSearch.solution([["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], "SEE"))
print(WordSearch.solution([["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], "ABCB"))
print(WordSearch.solution([["A", "A"]], "A"))
print(WordSearch.solution([["b","b","a","a","b","a"],["b","b","a","b","a","a"],["b","b","b","b","b","b"],["a","a","a","b","a","a"],["a","b","a","a","b","b"]], "abbbababaa"))


