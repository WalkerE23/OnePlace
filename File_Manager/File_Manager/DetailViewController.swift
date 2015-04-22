//
//  detailViewController.swift
//

import UIKit
class DetailViewController: UIViewController{
    
    
    @IBOutlet weak var testLabel: UILabel!
    @IBOutlet weak var fileTextLabel: UILabel!
    var filePath:String!
    
    var fileName:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var fp = filePath
        
        fileTextLabel.text = fp
        testLabel.text = fp.pathExtension
    }

}
