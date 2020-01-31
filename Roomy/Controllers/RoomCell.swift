//
//  RoomCell.swift
//  Roomy
//
//  Created by Hady on 1/21/20.
//  Copyright © 2020 gadou. All rights reserved.
//

import UIKit
import Kingfisher
class RoomCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var placeLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image3: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
      
    }
    
    // using Kingfisher
    func configure(imageUrl: String){
           image1.kf.setImage(with: URL(string: imageUrl), placeholder: nil, options: [.transition(.fade(0.7))], progressBlock: nil)
        image2.kf.setImage(with: URL(string: imageUrl), placeholder: nil, options: [.transition(.fade(0.7))], progressBlock: nil)
        image3.kf.setImage(with: URL(string: imageUrl), placeholder: nil, options: [.transition(.fade(0.7))], progressBlock: nil)
    }
}
