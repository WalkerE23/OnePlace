//
//  CreateNewFolderViewController.swift
//
//import UIKit
//
//var sampleText = "The Ford C-Max (stylized as Ford C-MAX and often called the Ford Focus C-Max) is a compact MPV produced since 2003 for the European market by Ford in Saarlouis, Germany.[2] Ford introduced the C-Max in the United States as its first hybrid-only line of vehicles, which includes the C-Max Hybrid, released in September 2012, and the C-Max Energi plug-in hybrid, launched in October 2012. Although C-Max was initially available only in Europe, the first generation was partially available in New Zealand. With the introduction of the new large MPVs S-Max and Galaxy, the C-Max is the second smallest multi-purpose vehicle of Ford's lineup, after the new B-Max."
//
//
//class FileCreateVC: UIViewController{
//    
//    @IBOutlet weak var nameField: UITextField!
//    
//    
//    func saveFile(name:String)->Bool{
//        let nsFileMgr = NSFileManager.defaultManager()
//        
//        var theFileName = "/" + name + ".txt"
//        var pathToFile = DOCUMENTS_FOLDER.stringByAppendingString(theFileName)
//        
//        
//        if(!fileMgr.nsFM.fileExistsAtPath(pathToFile)){
//                
//            var writeError:NSError?
//            let fileToBeWritten = sampleText.writeToFile(pathToFile, atomically: true, encoding: NSUTF8StringEncoding, error: &writeError)
//            if(writeError == nil){
//                println("file written")
//                return true
//            }
//            else{
//                println(writeError?.description)
//                return false
//            }
//        }
//        else{
//            println("file already exists here")
//            return false
//        }
//
//    }
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//    }
//    
//    
//    @IBAction func createFolder(sender: AnyObject) {
//        var name = nameField.text
//        var txt = sampleText
//        
//        
//        
//        if(nameField.text != ""){
//            //also will return us to the main view controller
//            
//            if(saveFile(name)){
//                var t = name + ".txt"
//                fileMgr.addFile(t)
//            }
//        }
//    }
//    
//    
//    
//    
//}