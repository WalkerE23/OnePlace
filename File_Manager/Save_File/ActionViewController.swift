//
//  ActionViewController.swift
//  Save_File
//
//  Copyright (c) 2015 Elliott Walker. All rights reserved.
//
import UIKit
import MobileCoreServices

class ActionViewController: UIViewController, UITextFieldDelegate {
    
    let DOCUMENTS_DIRECTORY = NSSearchPathDirectory.DocumentDirectory
    @IBOutlet weak var filenameTextBox: UITextField!
    var ready = false
    var x:NSData = NSData()
    var t:String = String()
    
    func getDocsDir()->String{
        let dirPaths = NSSearchPathForDirectoriesInDomains(DOCUMENTS_DIRECTORY, .UserDomainMask, true)
        let docsDir = dirPaths[0] as! String
        println(docsDir)
        return docsDir
    }
    
    
    @IBAction func save(sender: AnyObject) {
        println(filenameTextBox.text)
        if (ready) {
            self.t = self.getDocsDir().stringByAppendingPathComponent(filenameTextBox.text)
            println(t)
            x.writeToFile(t, atomically: true)
        }
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        filenameTextBox.delegate = self

        
        let filemgr = NSFileManager.defaultManager()
        
        var firstItem: AnyObject = self.extensionContext!.inputItems[0];
        var asdf = firstItem.attachments??[0] as! NSItemProvider
        var t = getDocsDir().stringByAppendingPathComponent("picture2.jpeg")
        var wut = firstItem.attributedContentText

        
        
        let contentType = kUTTypeData as String
        
        var x:NSData = NSData()
        var ready = false
        
        
        
        asdf.loadItemForTypeIdentifier(contentType, options: nil, completionHandler:{ (data, error) -> Void in
            var n:NSURL = data as! NSURL
            var nArray = split(n.absoluteString!) { $0 == "/" }
            var filename = nArray[nArray.endIndex - 1]
            //            println("filename: " + filename)
            self.t = self.getDocsDir().stringByAppendingPathComponent(filename)
            self.x = NSData(contentsOfURL: n)!
            self.ready = true
            self.filenameTextBox.text = filename
        })
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func done() {
        // Return any edited content to the host app.
        // This template doesn't do anything, so we just echo the passed in items.
        self.extensionContext!.completeRequestReturningItems(self.extensionContext!.inputItems, completionHandler: nil)
    }
    
}
