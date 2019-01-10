//
//  TopGamesSelectionDataSource.swift
//  TopGamesSelection
//
//  Created by Sadiya Syeda on 9/10/18.
//  Copyright © 2018 Sadiya Syeda. All rights reserved.

import UIKit

class TopGamesSelectionDataSource : NSObject{
    var topGamesViewController : TopGamesSelectionViewController
    init(topGamesViewController : TopGamesSelectionViewController){
        self.topGamesViewController = topGamesViewController
    }
}

extension TopGamesSelectionDataSource : UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return topGamesViewController.imageURLS.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GameInterestsCell", for: indexPath) as? GameInterestsCell else {
            fatalError("Couldnt instantiate the cell")
        }
        cell.gameInterestImageView.downloadedFrom(link : topGamesViewController.imageURLS[indexPath.row])
        return cell
    }
}
