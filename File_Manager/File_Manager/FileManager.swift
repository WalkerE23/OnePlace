//
//  Item.swift
//  File_Manager
//
//  Created by Elliott Walker on 4/6/15.
//  Copyright (c) 2015 Elliott Walker. All rights reserved.
//


//to do 
//dropbox
//cloud
//ui


import Foundation
import UIKit



let DOCUMENTS_DIRECTORY = NSSearchPathDirectory.DocumentDirectory



class FileManager: NSObject{
    
    
    var pathStringArray = [String]()
    var currentPath = String()
    var nsFM = NSFileManager.defaultManager()
    var mimeTypeDict = [String:String]()
    
    //Editing Variables
    var editingMode = Bool()
    var editingPathToChange = String()
    ///////////////
    
    //checks if file or directory, returning true if its a dir
    func checkFolderOrFile(path:String)->Bool{
        var isDir:ObjCBool = false
        var f = nsFM.fileExistsAtPath(path, isDirectory:&isDir)
        if(isDir){return true}
        else{return false}
    }
    
    //////////////
    
    func populatePathList(folderPath:String)->[String]{
        var popDirListError:NSError?
        var fullPathArray = [String]()
        var temp = NSFileManager.defaultManager().contentsOfDirectoryAtPath(folderPath, error: &popDirListError) as! [String]
        for(var i = 0; i < temp.count; i++){
            fullPathArray.append(folderPath + "/" + temp[i])
        }
        return fullPathArray
    }
    
    func getDocsDir()->String{
        let dirPaths = NSSearchPathForDirectoriesInDomains(DOCUMENTS_DIRECTORY,
            .UserDomainMask, true)
        let docsDir = dirPaths[0] as! String
        println(docsDir)
        return docsDir
    }
    
    func updateArray(){
        pathStringArray = populatePathList(self.currentPath)
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
            updateArray()
        }
    }
    func setCurrentPathHome(){
        self.currentPath = getDocsDir()
        updateArray()
    }
    func setCurrentPathForward(newPath:String){
        self.currentPath = newPath
        updateArray()
    }
    func addDirectory(path:String){
        pathStringArray.append(path)
    }
    
    //Transfers folders and files from given path to new given path
    func moveOver(fromPath: String, toPath: String){
        var newSubRoot = toPath.stringByAppendingPathComponent(fromPath.lastPathComponent)
        var moveError:NSError?
        if(self.nsFM.moveItemAtPath(fromPath, toPath: newSubRoot, error: &moveError)){
            println("successful")
        }
        else{
            println(moveError?.description)
        }
    }
    
    
    //----INIT----
    override init(){
        super.init()
        self.currentPath = getDocsDir()
        self.editingMode = false
        self.mimeTypeDict = ["txt":"text/plain","pdf":"application/pdf"]
        println(currentPath)
        self.pathStringArray = populatePathList(self.currentPath)

    }
    //------------
    
    func debugDisplayFolders(){
        for(var i = 0; i < pathStringArray.count;i++){
            println(pathStringArray[i])
        }
    }
}


//DEPRECIATED FILE METHODS\\

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

//    func addFile(name:String){
//        fileStringArray.append(name)
//    }


//        THIS SHOWS EVERYTHING BELOW THE CURRENT PATH: USEFUL FOR A LIST ALL? OR SEARCH?
//        let enumerator:NSDirectoryEnumerator = self.nsFM.enumeratorAtPath(folderPath)!
//        while let element = enumerator.nextObject() as? String {
//            temp.append(folderPath + "/" + element)
//        }
//        return temp
