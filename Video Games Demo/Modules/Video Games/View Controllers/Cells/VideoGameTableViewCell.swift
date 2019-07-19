//
//  VideoGameTableViewCell.swift
//  Video Games Demo
//
//  Created by Mohammad Shaker on 7/20/19.
//  Copyright © 2019 Mohammad Shaker. All rights reserved.
//

import UIKit
import Cosmos
import Kingfisher

class VideoGameTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var ratingView: CosmosView!

    
    func setup(title: String?, coverImageURL: String?, rating: Double) {
        titleLabel.text = title
        ratingView.rating = rating
        if coverImageURL != nil, let url = URL(string: coverImageURL!) {
            coverImageView.kf.setImage(with: url, placeholder: UIImage(named:"placeholder"))
        }
    }
    
}
