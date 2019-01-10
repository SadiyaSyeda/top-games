//
//  TopGamesSelectionViewController.swift
//  TopGamesSelection
//
//  Created by Sadiya Syeda on 9/7/18.
//  Copyright © 2018 Sadiya Syeda. All rights reserved.
//

import UIKit

class TopGamesSelectionViewController: UIViewController {
    
    @IBOutlet private weak var gameInterestsCollectionView: UICollectionView!
    private var tgDataSource : TopGamesSelectionDataSource?
    private var tgDelegate : TopGamesSelectionDelegate?
    
    var imageURLS: [String] = [] {
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
