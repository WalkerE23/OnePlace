//
//  WebViewVC.swift
//

import UIKit
class WebViewVC: UIViewController{

    
    @IBOutlet weak var webView: UIWebView!
    var path = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadFile(path)
    }
    
    func loadFile(path: String){
        webView.scalesPageToFit = true
        var exists = fileMgr.nsFM.fileExistsAtPath(path)
        if(exists){
            var data = NSData(contentsOfFile: path)
            webView.loadData(data, MIMEType: fileMgr.mimeTypeDict[path.pathExtension], textEncodingName: "UTF-8", baseURL: nil)
            
        }
        else{
            println("file does not exist")
            webView.backgroundColor = UIColor.redColor()
        }
    }
}
