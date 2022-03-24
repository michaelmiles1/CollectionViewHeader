//
//  WideCollectionViewCell.swift
//  CollectionViewHeader
//
//  Created by Michael Miles on 3/24/22.
//

import UIKit

class WideCollectionViewCell: UICollectionViewCell {
    override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
        let trueTarget: CGSize = .init(width: self.superview?.bounds.width ?? targetSize.width, height: 50)
        return super.systemLayoutSizeFitting(trueTarget, withHorizontalFittingPriority: .defaultHigh, verticalFittingPriority: verticalFittingPriority)
    }
}
