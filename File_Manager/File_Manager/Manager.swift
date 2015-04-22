//
//  Item.swift
//  File_Manager
//
//  Created by Elliott Walker on 4/6/15.
//  Copyright (c) 2015 Elliott Walker. All rights reserved.
//

import Foundation
import UIKit

var fileMgr:FileManager = FileManager()
let DOCUMENTS_DIRECTORY = NSSearchPathDirectory.DocumentDirectory



class FileManager: NSObject{
    
    //var fileStringArray = [String]()
    var directoriesStringArray = [String]()
    var currentPath = String()
    var nsFM = NSFileManager.defaultManager()
    
    
//    func populateFileList() -> [String]{
//        var popFileListError:NSError?
//        let dirs = NSSearchPathForDirectoriesInDomains(currentPath, NSSearchPathDomainMask.AllDomainsMask, true) as? [String]
//        if dirs != nil {
//            let dir = dirs![0]
//            let fileList = NSFileManager.defaultManager().contentsOfDirectoryAtPath(dir, error: &popFileListError)
//            return fileList as [String]
//        }else{
//            let fileList = [""]
//            return fileList
//        }
//    }
    
    func populateDirectoryList(folderPath:String)->[String]{
        var popDirListError:NSError?
        var fullPathArray = [String]()
        
        var temp = NSFileManager.defaultManager().contentsOfDirectoryAtPath(folderPath, error: &popDirListError) as [String]
        for(var i = 0; i < temp.count; i++){
            fullPathArray.append(folderPath + "/" + temp[i])
        }
        return fullPathArray

//        THIS SHOWS EVERYTHING BELOW THE CURRENT PATH: USEFUL FOR A LIST ALL? OR SEARCH?
//        let enumerator:NSDirectoryEnumerator = self.nsFM.enumeratorAtPath(folderPath)!
//        while let element = enumerator.nextObject() as? String {
//            temp.append(folderPath + "/" + element)
//        }
//        return temp
    }
    
    func getDocsDir()->String{
        let dirPaths = NSSearchPathForDirectoriesInDomains(DOCUMENTS_DIRECTORY,
            .UserDomainMask, true)
        
        let docsDir = dirPaths[0] as String
        return docsDir
    }
    
    func updateArrays(){
        directoriesStringArray = populateDirectoryList(self.currentPath)
        //fileStringArray = populateFileList()
    }
    
    func setCurrentPathBack(){
        if(currentPath == getDocsDir()){
            //check specifically for this, then do nothing
        }
        else{
            var splitStringArray = currentPath.componentsSeparatedByString("/")
            splitStringArray.removeLast()
            var j = "/"
            var tString = j.join(splitStringArray)
            self.currentPath = tString
            updateArrays()
        }
        
    }
    
    func setCurrentPathHome(){
        self.currentPath = getDocsDir()
        updateArrays()
    }
    
    func setCurrentPathForward(newPath:String){
        self.currentPath = newPath
        updateArrays()
    }

//    func addFile(name:String){
//        fileStringArray.append(name)
//    }
    
    func addDirectory(path:String){
        directoriesStringArray.append(path)
    }
    
    override init(){
        super.init()
        self.currentPath = getDocsDir()
        println(currentPath)
        //self.fileStringArray = populateFileList()
        self.directoriesStringArray = populateDirectoryList(self.currentPath)
        
        //debugDisplayFiles()
        //debugDisplayFolders()
    }
    
//    func debugDisplayFiles(){
//        var fileList = populateFileList()
//        let count = fileList.count
//        for(var i:Int=0; i < count; i++){
//            if nsFM.fileExistsAtPath(fileList[i]) != true
//            {
//                println("File is \(fileList[i])")
//            }
//        }
//    }
    
    func debugDisplayFolders(){
        for(var i = 0; i < directoriesStringArray.count;i++){
            println(directoriesStringArray[i])
        }
    }
    

}
