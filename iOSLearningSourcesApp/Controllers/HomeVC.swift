//
//  ViewController.swift
//  iOSLearningSourcesApp
//
//  Created by vamsi krishna reddy kamjula on 10/31/17.
//  Copyright © 2017 kvkr. All rights reserved.
//

import UIKit

class HomeVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, TwicketSegmentedControlDelegate {

    // MARK: - Outlets
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var customSegmentedControl: TwicketSegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        customSegmentedControl.delegate = self
        let sectionTitles = ["YouTube", "Website"]
        customSegmentedControl.setSegmentItems(sectionTitles)
    }
    
    func didSelect(_ segmentIndex: Int) {
        switch segmentIndex {
        case 0:
            print(segmentIndex)
        case 1:
            print(segmentIndex)
        default:
            print(segmentIndex)
        }
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return youtubeChannels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? InfoCell {
            cell.layer.cornerRadius = 5
            let info = youtubeChannels[indexPath.row]
            cell.titleLbl.text = info["Name"]
            cell.shortDescLbl.text = info["shortDescription"]
            cell.thumbnailImg.image = UIImage(named: info["CoverImage"]!)
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numOfColumns : CGFloat = 1
        
        let spaceBetweenCells : CGFloat = 5
        let padding : CGFloat = 10
        let cellDimension = ((collectionView.bounds.width - padding) - (numOfColumns - 1) * spaceBetweenCells) / numOfColumns
        return CGSize(width: cellDimension, height: collectionView.bounds.height * 0.3)
    }
}

