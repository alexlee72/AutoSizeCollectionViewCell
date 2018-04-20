//
//  FileNoteCollectionViewCell.swift
//  fiix-ios-tech
//
//  Created by Alex Lee on 2018-04-19.
//  Copyright © 2018 Fiix. All rights reserved.
//

import UIKit

extension UIView {
    func addBorder(color: UIColor = UIColor.black, width: CGFloat = 0.5) {
        layer.borderWidth = width
        layer.borderColor = color.cgColor
    }
    
    func round(cornerRadius: CGFloat) {
        layer.cornerRadius = cornerRadius
        layer.masksToBounds = true
    }
}

class FileNoteCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var noteLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var containerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
    }
    
    private func setupUI() {
        containerView.round(cornerRadius: 2)
        containerView.addBorder(color: UIColor.lightGray, width: 1.0)
    }
    
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        setNeedsLayout()
        layoutIfNeeded()

        layoutAttributes.bounds.size.height = systemLayoutSizeFitting(UILayoutFittingCompressedSize).height
        
        return layoutAttributes
    }
}
