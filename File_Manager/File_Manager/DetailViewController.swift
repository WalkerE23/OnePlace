//
//  detailViewController.swift
//

import UIKit
class DetailViewController: UIViewController{
    
    
    @IBOutlet weak var testLabel: UILabel!
    var dataText:String?
    
    
//    override func viewWillAppear(animated: Bool) {
//        testLabel.text = newText
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        testLabel.text = dataText

    }

}
