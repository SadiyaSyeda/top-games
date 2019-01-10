//
//  TopGamesSelectionDelegate.swift
//  TopGamesSelection
//
//  Created by Sadiya Syeda on 9/11/18.
//  Copyright © 2018 Sadiya Syeda. All rights reserved.
//

import UIKit

class TopGamesSelectionDelegate: NSObject{

    var tgController : TopGamesSelectionViewController
    init(tgController : TopGamesSelectionViewController){
        self.tgController = tgController
    }
}

extension TopGamesSelectionDelegate : UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let detailedImageViewController : DetailedImageViewController =
            tgController.storyboard?.instantiateViewController(withIdentifier: "DetailedImage") as? DetailedImageViewController else{
                return
        }
        detailedImageViewController.selectedImage = tgController.imageURLS[indexPath.row]
        tgController.navigationController?.pushViewController(detailedImageViewController, animated: true)
    }
}
