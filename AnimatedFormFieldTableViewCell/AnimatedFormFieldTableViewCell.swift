//
//  AnimatedFormFieldTableViewCell.swift
//  AnimatedFormFieldTableViewCell
//
//  Created by Zaltzberg, Ido on 25/07/2016.
//  Copyright © 2016 Intuit. All rights reserved.
//
import UIKit

public class AnimatedFormFieldTableViewCell: UITableViewCell, UITextFieldDelegate {
    public var delegate: UITextFieldDelegate?
    @IBOutlet weak private var cellLabel: UILabel!
    @IBOutlet weak var cellTextfield: UITextField!
    @IBOutlet weak var textFieldDistanceFromTopConstraint: NSLayoutConstraint!
    var scaledLabelMode = false
    
    
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        cellTextfield.delegate = self
        cellLabel.textColor = UIColor.gray
        textFieldDistanceFromTopConstraint.constant = 0
        cellTextfield.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        cellLabel.translatesAutoresizingMaskIntoConstraints = true
        cellLabel.sizeToFit()
    }
    
    func shrinkLabel(animated: Bool = true) {
        guard !scaledLabelMode else { return }
        scaledLabelMode = true
        
        DispatchQueue.main.async {
            self.textFieldDistanceFromTopConstraint.constant = 10
            
            let scaleLabelBlock = {
                self.cellLabel.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)
                self.cellLabel.frame.origin = CGPoint(x: 15, y: 14)
                self.layoutIfNeeded()
            }
            
            animated ? UIView.animate(withDuration: 0.3,
                                      delay: 0,
                                      options: .curveEaseOut,
                                      animations:scaleLabelBlock,
                                      completion: nil) : scaleLabelBlock()
        }
    }
    
    func growLabel(){
        guard scaledLabelMode else { return }
        scaledLabelMode = false
        guard let cellLabel = self.cellLabel else { return }
        DispatchQueue.main.async {
            self.textFieldDistanceFromTopConstraint.constant = 0
            UIView.animate(withDuration: 0.3,
                           delay: 0,
                           options: .curveEaseOut,
                           animations: {
                            cellLabel.transform = CGAffineTransform(scaleX: 1,y: 1)
                            cellLabel.frame.origin = CGPoint(x: 15, y: 20)
                            self.layoutIfNeeded()
            },completion: nil)
        }
    }
    
    public func setLabelText(text: String?) {
        cellLabel.text = text
        cellLabel.translatesAutoresizingMaskIntoConstraints = true
        cellLabel.sizeToFit()
    }
    
    @objc func textFieldDidChange(textField: UITextField) {
        if textField.text == "" {
            growLabel()
        } else {
            shrinkLabel()
        }
    }
    
    // MARK: UITextFieldDelegate
    
    public func textFieldDidBeginEditing(_ textField: UITextField) {
        delegate?.textFieldDidBeginEditing?(textField)
    }
    
    public func textFieldDidEndEditing(_ textField: UITextField) {
        delegate?.textFieldDidEndEditing?(textField)
    }
    
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return delegate?.textFieldShouldReturn?(textField) ?? false
        
    }
    
    public func textField(_ textField: UITextField,
                          shouldChangeCharactersIn range: NSRange,
                          replacementString string: String) -> Bool {
        return delegate?.textField?(textField, shouldChangeCharactersIn: range, replacementString: string) ?? true
    }
    
}
