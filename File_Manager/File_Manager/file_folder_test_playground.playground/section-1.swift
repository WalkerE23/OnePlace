// Playground - noun: a place where people can play

import Cocoa


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


class Folder:NSObject{
    var name:String = ""
    var internalFoldersArray:[Folder] = [Folder]()
    var filesArray:[File] = [File]()
    init(name:String){
        self.name = name
    }
    
}


class FileManager: NSObject{
    var itemArray = [Item]()
    
    func addItem(name:String, desc:String, text:String){
        itemArray.append(Item(name:name, desc:desc, text:text))
    }
}
