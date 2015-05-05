//
//  DropboxVC.swift
//  File_Manager
//
//  Created by Elliott Walker on 5/3/15.
//  Copyright (c) 2015 Elliott Walker. All rights reserved.
//

import UIKit
class DropboxVC: UIViewController{
    
    var p = "/Users/elliottw/Library/Developer/CoreSimulator/Devices/D90AF420-B6C0-4A4A-A596-AC41F318F359/data/Containers/Data/Application/4E3E6DE9-B35A-4207-BC90-2D25550CA134/Documents/myFiles/img.jpg"
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var logoutButton: UIButton!
    
    @IBAction func login(sender: AnyObject) {
        dropboxMgr.initiateAuthentication(self)
        loginButton.enabled = false
        logoutButton.enabled = true
    }
    
    @IBAction func logout(sender: AnyObject) {
        dropboxMgr.logout()
        logoutButton.enabled = false
        loginButton.enabled = true
        
    }
//    @IBAction func actionButton(sender: AnyObject) {
//        var temp = fileMgr.giveFileNameAndData(p)
//        var name = temp.0
//        var data = temp.1
//        dropboxMgr.saveFile(name, data: data)
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logoutButton.enabled = false
        loginButton.enabled = true
    }
    
    
}