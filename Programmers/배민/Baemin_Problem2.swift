//
//  Baemin_Problem2.swift
//  Programmers
//
//  Created by 심영민 on 2021/09/18.
//

import Foundation

class Baemin2 {
    enum FileType: CustomStringConvertible {
        case music, image, movie, other
        var description: String {
            switch self {
            case .music:
                return "music"
            case .image:
                return "images"
            case .movie:
                return "movies"
            case .other:
                return "other"
            }
        }
    }
    // 제출한코드
    static func solution(_ S: inout String) -> String {
        
        var resultTuple: [(fileType: FileType, size: Int)] = [
            (.music, 0),
            (.image, 0),
            (.movie, 0),
            (.other, 0)
        ]
        
        guard !S.isEmpty else {
            let resultString = resultTuple.map{ (fileType, size) in
                "\(fileType) \(size)b"
            }.joined(separator: "\r\n")
            
            return resultString
        }

        let stringLines = S.components(separatedBy: .newlines)
        
        var string: [String] = []
        var extensionName = ""
        var size = 0
        
        for str in stringLines {
            string = str.components(separatedBy: .whitespaces)
            extensionName = string[0].components(separatedBy: ".").last!
            size = Int(string[1].dropLast(1))!
            
            switch extensionName {
            case "mp3", "aac", "flac":
                resultTuple[0].size += size
            case "jpg", "bmp", "gif":
                resultTuple[1].size += size
            case "mp4", "avi", "mkv":
                resultTuple[2].size += size
            default:
                resultTuple[3].size += size
            }
        }
        
        let resultString = resultTuple.map{ (fileType, size) in
            "\(fileType) \(size)b"
        }.joined(separator: "\r\n")
        
        return resultString
    }
    
    static func solution2(_ S: inout String) -> String {
                var resultDictionary: [FileType: Int] = [
                    .music: 0,
                    .image: 0,
                    .movie: 0,
                    .other: 0
                ]
                
                let stringLines = S.components(separatedBy: .newlines)

                var string: [String] = []
                var extensionName = ""
                var size = 0
                
                for str in stringLines {
                    string = str.components(separatedBy: .whitespaces)
                    extensionName = string[0].components(separatedBy: ".").last!
                    size = Int(String(string[1].dropLast()))!
                    
                    switch extensionName {
                    case "mp3", "aac", "flac":
                        resultDictionary[.music]! += size
                    case "jpg", "bmp", "gif":
                        resultDictionary[.image]! += size
                    case "mp4", "avi", "mkv":
                        resultDictionary[.movie]! += size
                    default:
                        resultDictionary[.other]! += size
                    }
                }
                
                let resultString = resultDictionary.map{ (fileType, size) in
                    "\(fileType.description) \(size)b"
                }.joined(separator: "\r\n")
                
                return resultString
    }
}
