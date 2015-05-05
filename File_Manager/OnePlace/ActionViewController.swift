//
//  ActionViewController.swift
//  OnePlace
//
//  Copyright (c) 2015 Elliott Walker. All rights reserved.
//

import UIKit
import MobileCoreServices


class ActionViewController: UIViewController {
    
    
    ///WRITE TO SHARED FOLDER
    //METHOD IN OTHER CLASS TO CHECK FOR FILES IN SHARED FOLDER, WRITE THEM TO DOCSDIR
    //AND THEN DELETE FROM SHARED FORDER

    @IBOutlet weak var fileNameInput: UITextField!
    var dataToSave:NSData = NSData()
    var dataURL = NSURL()
    var filename = String()
    let contentType = kUTTypeData as String
    
    @IBOutlet weak var saved: UILabel!
    @IBOutlet weak var sButton: UIButton!
    
    @IBAction func saveButton(sender: AnyObject) {
        filename = self.fileNameInput.text
        let defaults = share.sharedUserDefaults()
        defaults.setObject(dataToSave, forKey: share.datakey())
        defaults.setObject(filename, forKey: share.namekey())
        sButton.enabled = false
        saved.hidden = false
    }
    
    override func viewDidLoad() {
        saved.hidden = true
        super.viewDidLoad()
        
        let filemgr = NSFileManager.defaultManager()
        
        var firstItem: AnyObject = self.extensionContext!.inputItems[0];
        var itemFromEx = firstItem.attachments??[0] as! NSItemProvider
        fillDataAndPath(itemFromEx)
        
    }
    
    func fillDataAndPath(item: NSItemProvider){
        item.loadItemForTypeIdentifier(contentType, options: nil, completionHandler:{ (data, error) -> Void in
            var tempData:NSURL = data as! NSURL
            self.dataURL = tempData
            var nArray = split(tempData.absoluteString!) { $0 == "/" }
            self.filename = nArray[nArray.endIndex - 1]
            self.dataToSave = NSData(contentsOfURL: tempData)!
            self.fileNameInput.text = self.filename
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func done() {
        // Return any edited content to the host app.
        // This template doesn't do anything, so we just echo the passed in items.
        self.extensionContext!.completeRequestReturningItems(self.extensionContext!.inputItems, completionHandler: nil)
    }

}


//////

