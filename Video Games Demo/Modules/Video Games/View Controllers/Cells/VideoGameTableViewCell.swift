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

protocol VideoGameTableViewCellDelegate: AnyObject {
    func videoGameCellRatingValueChanged(at index: Int, rating: Double)
}


class VideoGameTableViewCell: UITableViewCell {

    weak var delegate: VideoGameTableViewCellDelegate?
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var ratingView: CosmosView!
    private var index = -1

    
    override func prepareForReuse() {
        titleLabel.text = ""
        ratingView.rating = 0.0
        coverImageView.image = UIImage(named:"placeholder")
    }
    
    func setup(at index: Int, title: String?, coverImageURL: String?, rating: Double) {
        self.index = index
        titleLabel.text = title
        ratingView.rating = rating
        if coverImageURL != nil, let url = URL(string: coverImageURL!) {
            coverImageView.kf.setImage(with: url, placeholder: UIImage(named:"placeholder"))
        }
        
        ratingView.didFinishTouchingCosmos = { [unowned self] rating in
            self.delegate?.videoGameCellRatingValueChanged(at: index, rating: rating)
        }
    }
}
