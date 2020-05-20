//
//  FoodCell.swift
//  SushiVostok
//
//  Created by Eduard Sinyakov on 5/20/20.
//  Copyright © 2020 Eduard Siniakov. All rights reserved.
//

import UIKit

class FoodCell: UITableViewCell {
	@IBOutlet private weak var itemImage: UIImageView!
	@IBOutlet private weak var nameLabel: UILabel!
	@IBOutlet private weak var descriptionLabel: UILabel!
	@IBOutlet private weak var priceLabel: UILabel!

	var price = Int()
	var name = String()
	
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

	func update(food: Food) {
		itemImage.image = UIImage(named: food.image)
		nameLabel.text = food.name
		descriptionLabel.text = food.description
		priceLabel.text = String(food.price)
		price = food.price
		name = food.name
	}

}
