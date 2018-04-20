//
//  AutoSizeCollectionFlowLayout.swift
//  AutoSizeCollectionViewCell
//
//  Created by Alex Lee on 2018-04-20.
//  Copyright © 2018 Alex Lee. All rights reserved.
//

import UIKit

class AutoSizeCollectionFlowLayout: UICollectionViewFlowLayout {
    // Override size.width so that preferredLayoutAttributesFitting can calculate right height by performing auto layout
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        let attributes = super.layoutAttributesForItem(at: indexPath)
        guard let collectionView = collectionView else { return attributes }
        
        attributes?.bounds.size.width = collectionView.bounds.width - (sectionInset.left + sectionInset.right)
        
        return attributes
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let allAttributes = super.layoutAttributesForElements(in: rect)
        
        return allAttributes?.compactMap { attributes in
            switch attributes.representedElementCategory {
            case .cell: return layoutAttributesForItem(at: attributes.indexPath)
            default: return attributes
            }
        }
    }
}
