//
//  ViewController.swift
//  CollectionViewHeader
//
//  Created by Michael Miles on 3/24/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var sampleCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sampleCollectionView.delegate = self
        sampleCollectionView.dataSource = self
    }

}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        40
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WideCollectionViewCell", for: indexPath)
        cell.backgroundColor = .random()
        return cell
    }
}

extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}

extension UIColor {
    static func random() -> UIColor {
        return UIColor(
           red:   .random(),
           green: .random(),
           blue:  .random(),
           alpha: 1.0
        )
    }
}
