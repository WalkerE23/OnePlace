//
//  CreateNewFolderViewController.swift
//
import UIKit
class CreateNewFolderViewController: UIViewController{
    
    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var descField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func createFolder(sender: AnyObject) {
        if(nameField.text != ""){
            //also will return us to the main view controller
            var sampleText = "The Ford C-Max (stylized as Ford C-MAX and often called the Ford Focus C-Max) is a compact MPV produced since 2003 for the European market by Ford in Saarlouis, Germany.[2] Ford introduced the C-Max in the United States as its first hybrid-only line of vehicles, which includes the C-Max Hybrid, released in September 2012, and the C-Max Energi plug-in hybrid, launched in October 2012. Although C-Max was initially available only in Europe, the first generation was partially available in New Zealand. With the introduction of the new large MPVs S-Max and Galaxy, the C-Max is the second smallest multi-purpose vehicle of Ford's lineup, after the new B-Max."
//            fileMgr.addItem(nameField.text, desc: descField.text, text: sampleText)
        }
    }
    
}