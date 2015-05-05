//
//  SharedGroups.swift
//  File_Manager
//
//  Created by Elliott Walker on 5/5/15.
//  Copyright (c) 2015 Elliott Walker. All rights reserved.
//
import UIKit
class Share{
    
    
    func sharedUserDefaults()->NSUserDefaults{
        var shared = NSUserDefaults(suiteName: "group.extension_container")
        return shared!;
    }
    func datakey()->String{
        return "DATA_KEY"
    }
    func namekey()->String{
        return "NAME_KEY"
    }
}
var share = Share()
