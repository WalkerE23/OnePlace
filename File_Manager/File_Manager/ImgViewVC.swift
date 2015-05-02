//
//  ImgViewVC.swift
//

import UIKit
class ImgViewVC: UIViewController{
    
    @IBOutlet weak var imgView: UIImageView!
    var path = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadImg(path)
    }
    
    func loadImg(fileName: String){
        var exists = fileMgr.nsFM.fileExistsAtPath(path)
        if(exists){
            imgView.contentMode = .ScaleAspectFit
            imgView.image = UIImage(contentsOfFile: path)
        }
        else{
            println("file does not exist")
            imgView.backgroundColor = UIColor.redColor()
        }
        
        

    }
    
    
}
