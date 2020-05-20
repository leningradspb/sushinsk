//
//  ViewController.swift
//  SushiVostok
//
//  Created by Eduard Sinyakov on 5/20/20.
//  Copyright © 2020 Eduard Siniakov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet weak var tableView: UITableView!
	
	private let SaleCell = "SaleCell"
	private let saleTitles = ["СКИДКА 25% НА ВСЕ РОЛЛЫ – КРОМЕ ФИЛАДЕЛЬФИЙ" , "ПОДАРКИ НА ДЕНЬ РОЖДЕНИЯ", "1,5 КГ. ФИЛАДЕЛЬФИИ – 900 РУБ", "СЕТ КОМПЛИМЕНТ", "КРЕВЕТКА В КЛЯРЕ 266 РУБЛЕЙ!"]
	private let images = ["1" , "2", "3", "4", "5"]

	override func viewDidLoad() {
		super.viewDidLoad()
		setupTable()
	}

	private func setupTable() {
		tableView.delegate = self
		tableView.dataSource = self
	}
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		saleTitles.count
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: SaleCell, for: indexPath) as? SaleCell else { return UITableViewCell() }

		let image = UIImage(named: images[indexPath.row])
		let title = saleTitles[indexPath.row]

		cell.update(image: image!, title: title)
		return cell
	}

	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		245
	}


}
