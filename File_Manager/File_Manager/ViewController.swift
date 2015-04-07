//
//  ViewController.swift
//  File_Manager
//
//  Created by Elliott Walker on 4/6/15.
//  Copyright (c) 2015 Elliott Walker. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    var fileArray:NSMutableArray = NSMutableArray()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        driver.addItem("random",desc:"blob",text: "SHITHSwhat can you dowork with maximizer friends—> let them do the legworkbe a chooserapickerset yourself up (for fewer choices)SHTSHITHSwhat can you dowork with maximizer friends—> let them do the legworkbe a chooserapickerset yourself up (for fewer choices)SHT")
        driver.addItem("One",desc:"1111111111111",text: "OOOOOONNNNNEEEE")
        driver.addItem("Two",desc:"22222222222222",text: "TTTTTWWWWOOOO")
        driver.addItem("Three",desc:"333333333333333",text: "TTTTTTHHHHHRRRREEEEEE")
        driver.addItem("Four",desc:"44444444444444",text: "FFFFFFFOOOOOOOUUUUUUURRRR(EEEE)")
        driver.addItem("Five",desc:"55555555555555",text: "FFFFFFIIIIIIIVVVVVVEEEEE")
        driver.addItem("Six", desc: "666666666666",text: "SSSSSIIIIIIIIXXXXXXXXXX")
        driver.addItem("Hello", desc: "World",text: "This is all of my text for this object. currently it is hard coded in, but soon it will need to be dynamic, adn depend on the type of file. images for each type:pdf, file, docx, excel, etc. will also al be read only. also i want to have this integrated with dropbox, bookshelf,icloud, email and other things like that i need there to be more text here, but i think that itll be alright")
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return driver.itemArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "cell")
        
        cell.textLabel?.text = driver.itemArray[indexPath.row].name
        cell.detailTextLabel?.text = driver.itemArray[indexPath.row].desc
        return cell
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

