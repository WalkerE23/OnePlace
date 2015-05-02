//
//  ViewController.swift
//  

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    var fileArray:NSMutableArray = NSMutableArray()
    
    var index_path_holder:Int!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fileMgr.directoryArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "cell")
        
        
        cell.textLabel?.text = fileMgr.directoryArray[indexPath.row].name
//        cell.detailTextLabel?.text = fileMgr.directoryArray[indexPath.row].desc
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        index_path_holder = indexPath.row
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        self.performSegueWithIdentifier("cellToDetail", sender: self)
//        println(fileMgr.itemArray[indexPath.row].text)
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "cellToDetail") {
            if let destination = segue.destinationViewController as? DetailViewController {
//                destination.dataText = fileMgr.itemArray[index_path_holder].text
            }
        }
        else{
            println("Segue Error")
        }
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

