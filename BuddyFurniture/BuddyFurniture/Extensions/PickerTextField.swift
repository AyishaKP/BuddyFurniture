//
//  PickerTextField.swift
//  BuddyFurniture
//
//  Created by Ayisha on 04/07/18.
//  Copyright © 2018 Furniture. All rights reserved.
//

import UIKit

class PickerTextField: UITextField, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate {
    
    internal var picker: UIPickerView = UIPickerView(frame: .zero)
    fileprivate var toolbar: UIToolbar?
    
    internal var pickerData: NSArray = []
    fileprivate var titleObjectKey: String?
    
    var selectedPickerItem: NSObject?
    
    var doneButtonBlock: (() -> Void)?
    
    func attachFieldWithPickerData(_ data: NSArray = NSArray(),
                                   selectedItem: NSObject? = nil,
                                   titleKey: String? = nil) {
        
        picker.dataSource = self
        picker.delegate = self
        picker.backgroundColor = UIColor.blackColor
        pickerData = data
        titleObjectKey = titleKey
        selectedPickerItem = selectedItem
        picker.reloadAllComponents()
        
        if selectedPickerItem != nil {
            if pickerData.contains(selectedPickerItem!) {
                let index = pickerData.index(of: selectedPickerItem!)
                picker.selectRow(index, inComponent: 0, animated: false)
            }
            if let selectedPickerItem = selectedPickerItem as? String {
                text = selectedPickerItem
            } else if let titleKey = titleKey {
                text = selectedPickerItem!.value(forKey: titleKey) as? String
            }
        } else {
            text = ""
        }
        inputView = picker
        attachPickerDoneToolbar()
        
    }
    
    fileprivate func attachPickerDoneToolbar() {
        let cancelButton: UIBarButtonItem = UIBarButtonItem(title: "Cancel",
                                                            style: UIBarButtonItemStyle.plain,
                                                            target: self,
                                                            action: #selector(PickerTextField.cancelPressed(_:)))
        
        let attributes = [NSAttributedStringKey.foregroundColor: UIColor.seperatorLineColor,
                          NSAttributedStringKey.font: UIFont.systemFont(ofSize: 14)]
        
        cancelButton.setTitleTextAttributes(attributes, for: UIControlState())
        
        let flexibleButton: UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace,
                                                              target: nil,
                                                              action: nil)
        
        let doneButton: UIBarButtonItem = UIBarButtonItem(title: "Done",
                                                          style: UIBarButtonItemStyle.plain,
                                                          target: self,
                                                          action: #selector(PickerTextField.donePressed(_:)))
        
        doneButton.setTitleTextAttributes(attributes, for: UIControlState())
        
        toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: 44))
        toolbar!.barStyle = UIBarStyle.default
        toolbar!.isTranslucent = true
        toolbar!.tintColor = UIColor.darkGray
        toolbar!.setItems([cancelButton, flexibleButton, doneButton], animated: false)
        
        inputAccessoryView = toolbar
    }
    
    func attachDoneToolbar() {
        
        let doneButton: UIBarButtonItem = UIBarButtonItem(title: "Done",
                                                          style: UIBarButtonItemStyle.plain, target: self,
                                                          action: #selector(PickerTextField.cancelPressed(_:)))
        let attributes = [NSAttributedStringKey.foregroundColor: UIColor.red,
                          NSAttributedStringKey.font: UIFont.systemFont(ofSize: 14)]
        doneButton.setTitleTextAttributes(attributes, for: UIControlState())
        let flexibleButton: UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace,
                                                              target: nil,
                                                              action: nil)
        toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: 44))
        toolbar!.barTintColor = UIColor.blue
        toolbar!.backgroundColor = UIColor.green
        toolbar!.setItems([flexibleButton, doneButton], animated: false)
        
        inputAccessoryView = toolbar
    }
    
    // MARK: - UIPickerViewDataSource
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if let object = pickerData[row] as? String {
            return object
        }
        if let titleObjectKey = titleObjectKey {
            return (pickerData[row] as? NSObject)?.value(forKey: titleObjectKey) as? String
        }
        return nil
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView,
                    attributedTitleForRow row: Int,
                    forComponent component: Int) -> NSAttributedString? {
        if let title = pickerData[row] as? String {
            return NSAttributedString(string: title,
                                      attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
        }
        if let titleObjectKey = titleObjectKey {
            if let title = (pickerData[row] as? NSObject)?.value(forKey: titleObjectKey) as? String {
                return NSAttributedString(string: title,
                                          attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
            }
        }
        return nil
    }
    
    @objc func donePressed(_ sender: UIBarButtonItem) {
        if pickerData.count > 0 {
            selectedPickerItem = pickerData[picker.selectedRow(inComponent: 0)] as? NSObject
            if selectedPickerItem is String {
                text = selectedPickerItem as? String
            } else {
                text = selectedPickerItem?.value(forKey: titleObjectKey!) as? String
            }
        }
        resignFirstResponder()
        doneButtonBlock?()
    }
    
    @objc func cancelPressed(_ sender: UIBarButtonItem) {
        resignFirstResponder()
    }
}

