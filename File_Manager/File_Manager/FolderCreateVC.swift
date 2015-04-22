//
//  folderCreateVC.swift
//  File_Manager
//

import UIKit

class FolderCreateVC: UIViewController{
    
    @IBOutlet weak var nameField: UITextField!
    
    
    func addDirectory(){
        let currentPath = fileMgr.currentPath
        var createDirectoryError: NSError?
        let newDir = currentPath.stringByAppendingPathComponent(nameField.text)
        if !fileMgr.nsFM.createDirectoryAtPath(newDir, withIntermediateDirectories: false, attributes: nil, error: &createDirectoryError) {
                println("Failed to create dir: \(createDirectoryError!)")
        }
        else{
            fileMgr.addDirectory(newDir)
//            for(var i = 0; i < fileMgr.directoriesStringArray.count;i++){
//                //println(fileMgr.directoriesStringArray[i])
//            }
        }
    }

    @IBAction func createFolderButtonHit(sender: AnyObject) {
        if(nameField.text != ""){
            addDirectory()
        }
        else{
            println("need input")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}