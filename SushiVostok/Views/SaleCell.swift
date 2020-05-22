//
//  SaleCell.swift
//  SushiVostok
//
//  Created by Eduard Sinyakov on 5/20/20.
//  Copyright © 2020 Eduard Siniakov. All rights reserved.
//

import UIKit

class SaleCell: UITableViewCell {

	@IBOutlet private weak var imageItem: UIImageView!

	@IBOutlet private weak var itemLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

	func update(image: UIImage, title: String) {
		itemLabel.text = title
		imageItem.image = image
	}

}
