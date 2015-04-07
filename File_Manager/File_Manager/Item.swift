//
//  Item.swift
//  File_Manager
//
//  Created by Elliott Walker on 4/6/15.
//  Copyright (c) 2015 Elliott Walker. All rights reserved.
//

import Foundation
import UIKit

var driver:FileManager = FileManager()

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


class FileManager: NSObject{
    var itemArray = [Item]()
    
    func addItem(name:String, desc:String, text:String){
        itemArray.append(Item(name:name, desc:desc, text:text))
    }
}
