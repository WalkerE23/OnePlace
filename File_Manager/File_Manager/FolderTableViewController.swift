//
//  FolderTableViewController.swift


import UIKit
class FolderTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    
    //name and call the segue to itself. 
    //call that programatically when the cell is pressed
    //make a method called update() where all of the view did load code was
    //call self.update() in view did load. 
    //also call that in the segue which needs to "load the new page"
    //put parameters in update with the current directory
    //make way of tracking current directory in the fileMgr
    //make way to update current directory when cell is hit
    //restrict back button from going too far back...
    
    //make updating the window by requiring tableview funcs call to fileMgr.
    //think about type: file or folder
    //incorporate this type into the time of creation of each
    //tracking if the cell hit, what loads
    
    //determine if there is a way to check file type and how easy is that
    //if so, new approach:
    //change directories folders to paths. everything has its path taken care of, regardless of type, bc will check that later.
    //instantiate file specifics in the detail view. 
    //get that connection working totally.
    //figure out how you wanna do moving folders and files.
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var index_path_holder:Int!
    var temp_new_path_holder:String!

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func stripPath(s: String)->String{
        var tempStringArray = s.componentsSeparatedByString("/")
        return tempStringArray[tempStringArray.count - 1]
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fileMgr.directoriesStringArray.count
    }
    
    //create cells and put them in the table view
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "folderCell")
        cell.textLabel?.text = stripPath(fileMgr.directoriesStringArray[indexPath.row])
        return cell
    }
    
    //Selection of a cell
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        index_path_holder = indexPath.row
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        temp_new_path_holder = fileMgr.directoriesStringArray[indexPath.row]
        
        
        
        var isDir : ObjCBool = false
        var huh = fileMgr.nsFM.fileExistsAtPath(temp_new_path_holder, isDirectory:&isDir)
        if (huh) {
            if isDir {
                self.performSegueWithIdentifier("selfSegue", sender: self)
            } else {
                self.performSegueWithIdentifier("toDetail", sender: self)
            }
        } else {
            println("file does not exist")
        }
    }
    
    //delete folder/cell
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle , forRowAtIndexPath indexPath: NSIndexPath) {
        if(editingStyle == UITableViewCellEditingStyle.Delete){
            var deleteError:NSError?
            var tempFileString = fileMgr.directoriesStringArray[indexPath.row]

            fileMgr.directoriesStringArray.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
            fileMgr.nsFM.removeItemAtPath(tempFileString, error: &deleteError)
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if(segue.identifier == "selfSegue") {
            ///update all to new dir
            fileMgr.setCurrentPathForward(temp_new_path_holder)
        }
        if(segue.identifier == "backButtonSegue"){
            fileMgr.setCurrentPathBack()
        }
        if(segue.identifier == "homeButtonSegue"){
            fileMgr.setCurrentPathHome()
        }
        if(segue.identifier == "toDetail"){
            if let destination = segue.destinationViewController as? DetailViewController {
                destination.filePath = temp_new_path_holder
            }
        }
    }
    
    
}