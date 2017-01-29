//
//  FormViewController.swift
//  AnimatedFormFieldDemo
//
//  Created by Zaltzberg, Ido on 29/01/2017.
//  Copyright © 2017 Zaltzberg, Ido. All rights reserved.
//

import UIKit

class FormViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var titleLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Register the "AnimatedFormFieldTableViewCell" nib with the cell identifier string you would like to use
        self.tableView.registerNib(UINib(nibName:"AnimatedFormFieldTableViewCell", bundle: nil), forCellReuseIdentifier: "myCell")
    }
    
    
    //Set up UITableView
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        //Dequeuing the cell using the reuse identifier and casting it to AnimatedFormFieldTableViewCell
        if let cell = self.tableView.dequeueReusableCellWithIdentifier("myCell") as? AnimatedFormFieldTableViewCell {
            
            //Change placeholder text
            cell.setLabelText("Cell number \(indexPath.row)")
            
            //Set the UITextFieldDelegate to be this view controller (Note that the cell's delegate is of type UITextFieldDelegate so there's no need to set the delegate for the TextField itself - only for the cell
            cell.delegate = self
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        //For best results, row height should be 60
        return 60
    }
    
    
    //MARK - UITextFieldDelegate
    func textFieldDidEndEditing(textField: UITextField) {
        self.titleLabel.text = textField.text
    }
}
