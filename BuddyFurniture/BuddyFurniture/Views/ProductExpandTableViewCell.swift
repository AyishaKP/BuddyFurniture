//
//  ProductExpandTableViewCell.swift
//  BuddyFurniture
//
//  Created by Ayisha on 05/07/18.
//  Copyright © 2018 Furniture. All rights reserved.
//

import UIKit

class ProductExpandTableViewCell: AccordionTableViewCell {

    static let reuseIdentifier = "SampleTableViewCell"
    
    // MARK: Outlets
    
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var arrow: UIImageView! {
        didSet {
            arrow.tintColor = UIColor.black
        }
    }
    
    @IBOutlet weak var detailView: UIView!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    override func setExpanded(_ expanded: Bool, animated: Bool) {
        super.setExpanded(expanded, animated: animated)
        
        if animated {
            let alwaysOptions: UIViewAnimationOptions = [.allowUserInteraction,
                                                         .beginFromCurrentState,
                                                         .transitionCrossDissolve]
            let expandedOptions: UIViewAnimationOptions = [.transitionFlipFromTop, .curveEaseOut]
            let collapsedOptions: UIViewAnimationOptions = [.transitionFlipFromBottom, .curveEaseIn]
            let options = expanded ? alwaysOptions.union(expandedOptions) : alwaysOptions.union(collapsedOptions)
            
            UIView.transition(with: detailView, duration: 0.3, options: options, animations: {
                self.toggleCell()
            }, completion: nil)
        } else {
            toggleCell()
        }
    }
    
    // MARK: Helpers
    
    private func toggleCell() {
        detailView.isHidden = !expanded
        arrow.transform = expanded ? CGAffineTransform(rotationAngle: CGFloat.pi) : .identity
    }
}
