//
//  FoodCell.swift
//  SushiVostok
//
//  Created by Eduard Sinyakov on 5/20/20.
//  Copyright © 2020 Eduard Siniakov. All rights reserved.
//

import UIKit

class FoodCell: UITableViewCell {
	@IBOutlet weak var itemImage: UIImageView!
	@IBOutlet weak var nameLabel: UILabel!
	@IBOutlet weak var descriptionLabel: UILabel!
	@IBOutlet weak var priceLabel: UILabel!
	
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

	func update(food: Food) {
		itemImage.image = UIImage(named: food.image)
		nameLabel.text = food.name
		descriptionLabel.text = food.description
		priceLabel.text = String(food.price)
	}

}
