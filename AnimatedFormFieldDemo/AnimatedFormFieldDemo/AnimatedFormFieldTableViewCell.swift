//
//  AnimatedFormFieldTableViewCell.swift
//  AnimatedFormFieldTableViewCell
//
//  Created by Zaltzberg, Ido on 25/07/2016.
//  Copyright © 2016 Intuit. All rights reserved.
//
import UIKit

class AnimatedFormFieldTableViewCell: UITableViewCell, UITextFieldDelegate {
    var delegate: UITextFieldDelegate?
    @IBOutlet weak private var cellLabel: UILabel!
    @IBOutlet weak var cellTextfield: UITextField!
    @IBOutlet weak var textFieldDistanceFromTopConstraint: NSLayoutConstraint!
    var scaledLabelMode = false
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.cellTextfield.delegate = self
        self.cellLabel.textColor = UIColor.gray
        self.textFieldDistanceFromTopConstraint.constant = 0
        self.cellTextfield.addTarget(self, action: #selector(self.textFieldDidChange), for: .editingChanged)
        self.cellLabel.translatesAutoresizingMaskIntoConstraints = true
        self.cellLabel.sizeToFit()
    }
    
    func shrinkLabel(animated: Bool = true) {
        guard !self.scaledLabelMode else { return }
        self.scaledLabelMode = true
        
        DispatchQueue.main.async {
            self.textFieldDistanceFromTopConstraint.constant = 10

            let scaleLabelBlock = {
                self.cellLabel.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)
                self.cellLabel.frame.origin = CGPoint(x: 15, y: 14)
                self.layoutIfNeeded()

            }

            animated ? UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut, animations:scaleLabelBlock ,completion: nil ) : scaleLabelBlock()
        }
    }
    
    func growLabel(){
        guard self.scaledLabelMode else { return }
        self.scaledLabelMode = false
        guard let cellLabel = self.cellLabel else { return }
        DispatchQueue.main.async {
            self.textFieldDistanceFromTopConstraint.constant = 0
            UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut,
                           animations: {
                            cellLabel.transform = CGAffineTransform(scaleX: 1,y: 1)
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
    
    @objc func textFieldDidChange(textField: UITextField) {
        if textField.text == "" {
            self.growLabel()
        }
        else {
            self.shrinkLabel()
        }
    }
    
    // MARK: UITextFieldDelegate
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        delegate?.textFieldDidBeginEditing?(textField)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        delegate?.textFieldDidEndEditing?(textField)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return delegate?.textFieldShouldReturn?(textField) ?? false
        
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return delegate?.textField?(textField, shouldChangeCharactersIn: range, replacementString: string) ?? true
    }
    
}
