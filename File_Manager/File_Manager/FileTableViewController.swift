//
//  ViewController.swift
//  
//
//import UIKit
//
//var DOCUMENTS_FOLDER = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as String
//
//
//class FileTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
//    
//    @IBOutlet weak var tableView: UITableView!
//    
//    var index_path_holder:Int!
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//    }
//    
//    //determine number of cells to make
//    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return fileMgr.fileStringArray.count
//    }
//    
//    //create cells and put them in the table view
//    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        var cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "cell")
//        cell.textLabel?.text = fileMgr.fileStringArray[indexPath.row]
//        return cell
//    }
//    
//    //Selection of a cell
//    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        index_path_holder = indexPath.row
//        tableView.deselectRowAtIndexPath(indexPath, animated: true)
//        self.performSegueWithIdentifier("cellToDetail", sender: self)
//    }
//    
//    //delete a cell
//    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle , forRowAtIndexPath indexPath: NSIndexPath) {
//        if(editingStyle == UITableViewCellEditingStyle.Delete){
//            
//            var deleteError:NSError?
//            var tempFileString = DOCUMENTS_FOLDER + "/" + fileMgr.fileStringArray[indexPath.row]
//            
//            fileMgr.fileStringArray.removeAtIndex(indexPath.row)
//            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
//            fileMgr.nsFM.removeItemAtPath(tempFileString, error: &deleteError)
//            
//        }
//        
//    }
//    
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
//        if (segue.identifier == "cellToDetail") {
//            if let destination = segue.destinationViewController as? DetailViewController {
//                //destination.dataText = fileMgr.fileStringArray[index_path_holder]
//                destination.fileName = fileMgr.fileStringArray[index_path_holder]
//            }
//        }
//    }
//
//    
//    
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//
//
//}

