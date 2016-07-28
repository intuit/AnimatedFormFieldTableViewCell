//
//  AnimatedFormFieldTableViewCell.swift
//  AnimatedFormFieldTableViewCell
//
//  Created by Zaltzberg, Ido on 25/07/2016.
//  Copyright © 2016 Intuit. All rights reserved.
//

class AnimatedFormFieldTableViewCell: UITableViewCell, UITextFieldDelegate {
    var delegate: UITextFieldDelegate?
    @IBOutlet weak private var cellLabel: UILabel!
    @IBOutlet weak var cellTextfield: UITextField!
    @IBOutlet weak var textFieldDistanceFromTopConstraint: NSLayoutConstraint!
    var scaledLabelMode = false
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.cellTextfield.delegate = self
        self.cellLabel.textColor = UIColor.grayColor()
        self.textFieldDistanceFromTopConstraint.constant = 0
        self.cellTextfield.addTarget(self, action: #selector(self.textFieldDidChange), forControlEvents: .EditingChanged)
        self.cellLabel.translatesAutoresizingMaskIntoConstraints = true
        self.cellLabel.sizeToFit()
    }
    
    func shrinkLabel(animated: Bool = true) {
        guard !self.scaledLabelMode else { return }
        self.scaledLabelMode = true
        
        
        dispatch_async(dispatch_get_main_queue()){
            self.textFieldDistanceFromTopConstraint.constant = 10
            
            let scaleLabelBlock = {
                self.cellLabel.transform = CGAffineTransformMakeScale(0.6, 0.6)
                self.cellLabel.frame.origin = CGPoint(x: 15, y: 14)
                self.layoutIfNeeded()
                
            }
            
            animated ? UIView.animateWithDuration(0.3, delay: 0, options: .CurveEaseOut, animations:scaleLabelBlock ,completion: nil ) : scaleLabelBlock()
            
            
        }
    }
    
    func growLabel(){
        guard self.scaledLabelMode else { return }
        self.scaledLabelMode = false
        guard let cellLabel = self.cellLabel else { return }
        dispatch_async(dispatch_get_main_queue()){
            self.textFieldDistanceFromTopConstraint.constant = 0
            UIView.animateWithDuration(0.3, delay: 0, options: .CurveEaseOut,
                                       animations: {
                                        cellLabel.transform = CGAffineTransformMakeScale(1,1)
                                        self.cellLabel.frame.origin = CGPoint(x: 15, y: 20)
                                        self.layoutIfNeeded()
                                        
                },completion:nil)
        }
    }
    
    func setLabelText(text: String?) {
        self.cellLabel.text = text
        self.cellLabel.translatesAutoresizingMaskIntoConstraints = true
        self.cellLabel.sizeToFit()
    }
    
    func textFieldDidChange(textField: UITextField) {
        if textField.text == "" {
            self.growLabel()
        }
        else {
            self.shrinkLabel()
        }
    }
    
    // MARK: UITextFieldDelegate
    
    func textFieldDidBeginEditing(textField: UITextField) {
        delegate?.textFieldDidBeginEditing?(textField)
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        delegate?.textFieldDidEndEditing?(textField)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        return delegate?.textFieldShouldReturn?(textField) ?? false
        
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        return delegate?.textField?(textField, shouldChangeCharactersInRange: range, replacementString: string) ?? true
    }
    
}