//
//  ProductDetailVC.swift
//  BuddyFurniture
//
//  Created by Ayisha on 05/07/18.
//  Copyright © 2018 Furniture. All rights reserved.
//

import UIKit

class ProductDetailVC: UIViewController {

    @IBOutlet weak var conatinerView: UIView!
    @IBOutlet weak var quantityPickerView: UIPickerView!
    @IBOutlet weak var viewForPicker: UIView!
    @IBOutlet weak var viewheightConstraint: NSLayoutConstraint!
    @IBOutlet weak var quantityLabel: UILabel!
    var cartButton: UIBarButtonItem?
    
    var arrayQuantities:[String] = []
    var product: Products?
    override func viewDidLoad() {
        super.viewDidLoad()

        quantityPickerView.delegate = self
        quantityPickerView.dataSource = self
        title = product?.productName
        customise()
        
    }
    private func customise() {
        DispatchQueue.main.async { [weak self] in
            guard let weakSelf = self else { return }
            guard let product = weakSelf.product else { return }
            
            if let childVC = weakSelf.childViewControllers.first as? ProductContentTVC {
                childVC.product = product
            }
            for i in stride(from: 1, to: product.quantity, by: 1) {
                weakSelf.arrayQuantities.append(String(i))
            }
            weakSelf.quantityPickerView.reloadAllComponents()
            weakSelf.quantityLabel.text  = product.quantity > 0 ? "1" : "0"
            
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func didTapQuanty(_ sender: UIButton) {
        guard let product = product else { return }
        viewForPicker.isHidden = product.quantity == 0
    }
    @IBAction func didTapAddToCart(_ sender: UIButton) {
    }
    
    @IBAction func didTapDone(_ sender: UIButton) {
        
        UIView.animateKeyframes(withDuration: 0.2, delay: 0.2, options: .beginFromCurrentState, animations: {
            
            let data = self.arrayQuantities[(self.quantityPickerView?.selectedRow(inComponent: 0))!]
            self.quantityLabel.text = data
            self.viewForPicker.isHidden = true
            
            
        }, completion: nil)
    }
    
    @IBAction func didTapCancel(_ sender: UIButton) {
        
        UIView.animate(withDuration: 0.2) {
            self.viewForPicker.isHidden = true
        }
    }
}
extension ProductDetailVC: UIPickerViewDataSource,UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return arrayQuantities.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return arrayQuantities[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
    }
}
