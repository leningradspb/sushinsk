//
//  BasketCell.swift
//  SushiVostok
//
//  Created by Eduard Sinyakov on 5/20/20.
//  Copyright © 2020 Eduard Siniakov. All rights reserved.
//

import UIKit

class BasketCell: UITableViewCell {

	@IBOutlet weak var price: UILabel!
	@IBOutlet weak var name: UILabel!
	
	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

	func update(name: String, price: Int) {
		self.price.text = String(price)
		self.name.text = name
		print(name)
	}

}
