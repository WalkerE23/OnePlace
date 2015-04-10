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

class Item: NSObject{
    var name:String = "NA"
    var desc:String = "NA"
    var text:String = "NA"
    init(name:String, desc:String,text:String) {
        self.name = name
        self.desc = desc
        self.text = text
    }
}

class File:NSObject{
    //possible NSFileManager here
    
    var name:String = "NA"
    var desc:String = "NA"
    var text:String = "NA"
    
    init(name:String, desc:String,text:String) {
        self.name = name
        self.desc = desc
        self.text = text
    }
    
}


class Directory:NSObject{
    var name:String = ""
    var desc:String = ""
    
    var internalFoldersArray:[Directory] = [Directory]()
    
    var filesArray:[File] = [File]()
    
    init(name:String){
        self.name = name
    }

}


class FileManager: NSObject{
    //root, driver, manager, etc
    var directoryArray = [Directory]()
    var fileArray = [File]()
    var itemArray = [Item]()
    
    func addDirectory(name:String){
        directoryArray.append(Directory(name: name))
    }
    
    func addItem(name:String, desc:String, text:String){
        itemArray.append(Item(name:name, desc:desc, text:text))
    }
    

}
