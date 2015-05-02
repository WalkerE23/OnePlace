//
//  ActionViewController.swift
//  saveFile
//
//  Created by Deli-MAC on 5/1/15.
//  Copyright (c) 2015 Elliott Walker. All rights reserved.
//

import UIKit
import MobileCoreServices

class ActionViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var imageView: UIImageView!
    
    let DOCUMENTS_DIRECTORY = NSSearchPathDirectory.DocumentDirectory
    
    
    
    func getDocsDir()->String{
        let dirPaths = NSSearchPathForDirectoriesInDomains(DOCUMENTS_DIRECTORY, .UserDomainMask, true)
        let docsDir = dirPaths[0] as String
        println(docsDir)
        return docsDir
    }

    var ready = false
    var x:NSData = NSData()
    var t:String = String()

    @IBOutlet weak var filenameTextBox: UITextField!
    
    
    @IBAction func filenameInput(sender: AnyObject) {
        println(filenameTextBox.text)
        if (ready) {
            self.t = self.getDocsDir().stringByAppendingPathComponent(filenameTextBox.text)
            x.writeToFile(t, atomically: true)
        }
    }

    @IBAction func saveButton(sender: AnyObject) {
        println(filenameTextBox.text)
        if (ready) {
            self.t = self.getDocsDir().stringByAppendingPathComponent(filenameTextBox.text)
            x.writeToFile(t, atomically: true)
        }
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Get the item[s] we're handling from the extension context.
        
        filenameTextBox.delegate = self
        
        
//        // For example, look for an image and place it into an image view.
//        // Replace this with something appropriate for the type[s] your extension supports.
        //        var imageFound = false        // array of items in input: self.extensionContext!.inputItems
        
        //getDocsDir()
        
        let filemgr = NSFileManager.defaultManager()
        
        var firstItem: AnyObject = self.extensionContext!.inputItems[0];
        var asdf = firstItem.attachments??[0] as NSItemProvider
        var t = getDocsDir().stringByAppendingPathComponent("picture2.jpeg")
        var wut = firstItem.attributedContentText
        //var stuff = firstItem.userInfo?[0].value[0]
        
//        let url = String(kUTTypeURL)
//        asdf.loadItemForTypeIdentifier(url, options: nil, completionHandler:{ (urlData,error) -> Void in
//            var ud2 = urlData as NSURL
//            println("URL: " + ud2.absoluteString!)
//        })
        
        
        let contentType = kUTTypeData as String
        
        var x:NSData = NSData()
        var ready = false
        
        
        
        asdf.loadItemForTypeIdentifier(contentType, options: nil, completionHandler:{ (data, error) -> Void in
            var n:NSURL = data as NSURL
            var nArray = split(n.absoluteString!) { $0 == "/" }
            var filename = nArray[nArray.endIndex - 1]
//            println("filename: " + filename)
            self.t = self.getDocsDir().stringByAppendingPathComponent(filename)
            self.x = NSData(contentsOfURL: n)!
            self.ready = true
            self.filenameTextBox.text = filename
        })
        
        
        

//        for item: AnyObject in self.extensionContext!.inputItems {
//            let inputItem = item as NSExtensionItem
//            for provider: AnyObject in inputItem.attachments! {
//                let itemProvider = provider as NSItemProvider
//                if itemProvider.hasItemConformingToTypeIdentifier(kUTTypeImage as NSString) {
//                    // This is an image. We'll load it, then place it in our image view.
//                    weak var weakImageView = self.imageView
//                    itemProvider.loadItemForTypeIdentifier(kUTTypeImage as NSString, options: nil, completionHandler: { (image, error) in
//                        if image != nil {
//                            NSOperationQueue.mainQueue().addOperationWithBlock {
//                                if let imageView = weakImageView {
//                                    imageView.image = image as? UIImage
//                                }
//                            }
//                        }
//                    })
//                    
//                    imageFound = true
//                    break
//                }
//            }
//            
//            if (imageFound) {
//                // We only handle one image, so stop looking for more.
//                break
//            }
//        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func done() {
        // Return any edited content to the host app.
        // This template doesn't do anything, so we just echo the passed in items.
        self.extensionContext!.completeRequestReturningItems(self.extensionContext!.inputItems, completionHandler: nil)
    }

}
