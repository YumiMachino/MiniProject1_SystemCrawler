//
//  main.swift
//  systemCrawer
//
//  Created by Yumi Machino on 2021/03/12.
//

import Foundation

var directories = 0;
var files = 0;
var tempString = ""

func getFileNames(_ path: String) {
    let fileManager = FileManager.default
    let fileNames = try? fileManager.contentsOfDirectory(atPath: path)
    
    if !fileManager.fileExists(atPath: path) {
        print(tempString)
        print("│")
        tempString = ""
        return
        
    } else {
        if let fileNames = fileNames {
            directories += 1
            files = files + fileNames.count
            for i in 0..<fileNames.count {
                if i == 0 { tempString = tempString + "├─"}
                if i != 0 {
                    tempString = tempString + "\n└─"
                }
            tempString = tempString + "\(fileNames[i])\n"
            getFileNames(FileManager.default.currentDirectoryPath + "/\(fileNames[i])")
        }
        }
    }
}

print("current directory path contents:")
print(FileManager.default.currentDirectoryPath)
let fileNames = try? FileManager.default.contentsOfDirectory(atPath: FileManager.default.currentDirectoryPath)
if let fileNames = fileNames {
    print(fileNames)
}

getFileNames(FileManager.default.currentDirectoryPath)
print("directories: \(directories), files: \(files)")



