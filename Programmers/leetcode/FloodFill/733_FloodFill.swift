//
//  FloodFill.swift
//  Programmers
//
//  Created by 심영민 on 2021/09/06.
//

import Foundation

class FloodFill {
    static func floodFill(_ image: [[Int]], _ sr: Int, _ sc: Int, _ newColor: Int) -> [[Int]] {
        var image = image
        let target = image[sr][sc]
        var checkList = Array(repeating: Array<Int>(repeating: 0, count: image[0].count), count: image.count)
        
        func dfs(_ countX: Int, _ countY: Int) {

            guard countX >= 0 && countX < image.count else {
                return
            }
            
            guard countY >= 0 && countY < image[0].count else {
                return
            }
            
            if checkList[countX][countY] == 1 || image[countX][countY] != target{
                return
            }
            checkList[countX][countY] = 1
            
            image[countX][countY] = newColor
            dfs(countX, countY-1)
            dfs(countX-1, countY)
            dfs(countX, countY+1)
            dfs(countX+1, countY)
        }
        
        dfs(sr, sc)
        return image
    }
}
