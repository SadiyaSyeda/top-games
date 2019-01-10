//
//  TopGamesSelectionViewController.swift
//  TopGamesSelection
//
//  Created by Sadiya Syeda on 9/7/18.
//  Copyright © 2018 Sadiya Syeda. All rights reserved.
//

import UIKit

class TopGamesSelectionViewController: UIViewController {
    
    @IBOutlet weak var gameInterestsCollectionView: UICollectionView!
    
    var tgDataSource : TopGamesSelectionDataSource?
    var tgDelegate : TopGamesSelectionDelegate?
    
    var imageURLS : [String] = []{
        didSet{
            DispatchQueue.main.async {
                self.gameInterestsCollectionView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tgDataSource = TopGamesSelectionDataSource(topGamesViewController:self)
        tgDelegate = TopGamesSelectionDelegate(tgController : self)
        gameInterestsCollectionView.dataSource = tgDataSource
        gameInterestsCollectionView.delegate = tgDelegate
        HomeNetworkManager.shared.fetchGames{(urls) in
            self.imageURLS = urls
        }
        
    }

   

}
