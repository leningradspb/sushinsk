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

	private let names = ["КАМЕЛИЯ", "АЛЯСКА" ]
	private let descriptions = ["Состав: нори, рис, омлет, жареная кожа семги,помидор, кунжут, сыр хохланд, икра масага", "Состав: Нори, Рис, Лосось, Лук, Огурец, Сыр, Кунжут"]
	private let prices: [Int] = [220, 195, 189, 340, 195, 189, 195, 210, 133, 210, 195, 80, 195, 210]
	private let images = ["r1", "r2", "r3", "r4", "r5", "r6", "r7", "r8", "r9", "r10", "r11", "r12", "r13", "r14"]

    override func viewDidLoad() {
        super.viewDidLoad()
		setupTableView()
		print(prices.count)
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
