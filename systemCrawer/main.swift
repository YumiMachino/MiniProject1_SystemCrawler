//
//  main.swift
//  systemCrawer
//
//  Created by Yumi Machino on 2021/03/12.
//

import Foundation

var temp = [String]();
func getFileNames(_ path: String) {
    let fileManager = FileManager.default
    
    // get file names inside the directory
    let fileNames = try? fileManager.contentsOfDirectory(atPath: path)
    
    // base case: if there are no items in the contentsOfDirectory
    if !fileManager.fileExists(atPath: fileNames?[0] ?? "") {
        print(temp)
    } else {
        if let fileNames = fileNames {
            temp.append(fileNames[0])
            getFileNames(fileNames[1])
        }
    }
}

getFileNames(FileManager.default.currentDirectoryPath)

