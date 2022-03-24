//
//  CustomFlowLayout.swift
//  CollectionViewHeader
//
//  Created by Michael Miles on 3/24/22.
//

import UIKit

class CustomFlowLayout: UICollectionViewFlowLayout {
    override func awakeFromNib() {
        super.awakeFromNib()
        itemSize = CGSize(width: collectionView!.frame.width, height: 40)
        headerReferenceSize = CGSize(width: collectionView!.frame.width, height: 50)
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        true
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var attribs = super.layoutAttributesForElements(in: rect)! as [UICollectionViewLayoutAttributes]
        
        let header = NSMutableIndexSet()
        for attrib in attribs {
            if attrib.representedElementCategory == .cell {
                header.add(attrib.indexPath.section)
            }
        }
        for attrib in attribs {
            if let kind = attrib.representedElementKind {
                if kind == UICollectionView.elementKindSectionHeader {
                    header.remove(attrib.indexPath.section)
                }
            }
        }
        header.enumerate { index, stop in
            let indexPath = IndexPath(item: 0, section: index)
            let attributes = self.layoutAttributesForSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, at: indexPath)
            attribs.append(attributes!)
        }
        
        for attrib in attribs {
            if let kind = attrib.representedElementKind,
               kind == UICollectionView.elementKindSectionHeader {
                //working on section header here
                let section = attrib.indexPath.section
                let attribsForFirstItem = layoutAttributesForItem(at: IndexPath(item: 0, section: section))
                var frame = attrib.frame
                let offset = collectionView!.contentOffset.y
                let minY = attribsForFirstItem!.frame.minY - frame.height
                let yValue = min(offset, minY)
                frame.origin.y = yValue
                attrib.frame = frame
                attrib.zIndex = 99
                
            }
        }
        return attribs
    }
    
    override func layoutAttributesForSupplementaryView(ofKind elementKind: String, at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        let attrib = UICollectionViewLayoutAttributes(forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, with: indexPath)
        return attrib
    }
}
