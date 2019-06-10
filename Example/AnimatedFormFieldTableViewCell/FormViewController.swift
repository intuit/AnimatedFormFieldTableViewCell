//
//  FormViewController.swift
//  AnimatedFormFieldDemo
//
//  Created by Zaltzberg, Ido on 29/01/2017.
//  Copyright © 2017 Zaltzberg, Ido. All rights reserved.
//

import UIKit
import AnimatedFormFieldTableViewCell

class FormViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var titleLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        /* Register the "AnimatedFormFieldTableViewCell" nib with the cell identifier string you would like to use,
         and make sure to load it from the Pod's bundle */
        let bundle = Bundle(for: AnimatedFormFieldTableViewCell.classForCoder())
        tableView.register(UINib(nibName: "AnimatedFormFieldTableViewCell", bundle: bundle),
                           forCellReuseIdentifier: "myCell")
    }
    
    
    //Set up UITableView
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //Dequeuing the cell using the reuse identifier and casting it to AnimatedFormFieldTableViewCell
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "myCell") as? AnimatedFormFieldTableViewCell
            else {
                return UITableViewCell()
        }
        
        //Change placeholder text
        cell.setLabelText(text: "Cell number \(indexPath.row)")
        
        //Set the UITextFieldDelegate to be this view controller (Note that the cell's delegate is of type UITextFieldDelegate so there's no need to set the delegate for the TextField itself - only for the cell
        cell.delegate = self
        return cell
    }


    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //For best results, row height should be 60
        return 60
    }
    
    
    //MARK - UITextFieldDelegate
    func textFieldDidEndEditing(_ textField: UITextField) {
        titleLabel.text = textField.text
    }
}
