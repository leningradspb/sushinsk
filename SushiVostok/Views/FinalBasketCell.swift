//
//  FinalBasketCell.swift
//  SushiVostok
//
//  Created by Eduard Sinyakov on 5/21/20.
//  Copyright © 2020 Eduard Siniakov. All rights reserved.
//

import UIKit

class FinalBasketCell: UITableViewCell {
	@IBOutlet private weak var nameLabel: UILabel!
	@IBOutlet private weak var priceLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

	func update(name: String, price: Int) {
		nameLabel.text = name
		priceLabel.text = "\(price) ₽"
	}
}
