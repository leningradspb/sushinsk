//
//  FoodController.swift
//  SushiVostok
//
//  Created by Eduard Sinyakov on 5/20/20.
//  Copyright © 2020 Eduard Siniakov. All rights reserved.
//

import UIKit

class FoodController: UIViewController {
	@IBOutlet weak var tableView: UITableView!

	private let FoodCell = "FoodCell"

	private let names = [""]
	private let descriptions = [""]
	private let prices: [Int] = [1]
	private let images = [""]

    override func viewDidLoad() {
        super.viewDidLoad()


    }
    

	private func setupTableView() {
		tableView.delegate = self
		tableView.dataSource = self
	}


}

extension FoodController: UITableViewDataSource, UITableViewDelegate {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		names.count
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: FoodCell, for: indexPath) as? FoodCell else { return UITableViewCell() }

		let image = images[indexPath.row]
		let name = names[indexPath.row]
		let price = prices[indexPath.row]
		let description = descriptions[indexPath.row]

		cell.update(food: Food(name: name, description: description, price: price, image: image))
		return cell
	}

	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		357
	}


}
