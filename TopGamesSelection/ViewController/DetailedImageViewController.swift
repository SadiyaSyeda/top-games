//
//  DetailedImageViewController.swift
//  TopGamesSelection
//
//  Created by Sadiya Syeda on 9/11/18.
//  Copyright © 2018 Sadiya Syeda. All rights reserved.
//

import UIKit

class DetailedImageViewController: UIViewController {
    @IBOutlet weak var detailedImageView: UIImageView!
    var selectedImage : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        DispatchQueue.global().async {
            let imageURL = URL(string: self.selectedImage)
            let imageData = NSData(contentsOf: imageURL!)
            DispatchQueue.main.async {
                if(imageData != nil){
                    self.detailedImageView.image = UIImage(data : imageData! as Data)
                }
            }
        }
    }

}
