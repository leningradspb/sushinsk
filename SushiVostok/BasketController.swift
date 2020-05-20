//
//  BasketController.swift
//  SushiVostok
//
//  Created by Eduard Sinyakov on 5/20/20.
//  Copyright © 2020 Eduard Siniakov. All rights reserved.
//

import UIKit

var names = [String]()
var price = [Int]()

class BasketController: UIViewController {
	private let BasketCell = "BasketCell"

	//var values = [Int]()
	//var keys = [String]()

	@IBOutlet weak var tableView: UITableView!
	@IBOutlet weak var order: UILabel!

	override func viewDidLoad() {
        super.viewDidLoad()

//		//values = BasketSumm.shared.basket.map { $0.value }
//
//		keys = BasketSumm.shared.basket.map { $0.key }
//		tableView.reloadData()
		//let keys = dict.allKeys as? [String]



        
    }

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(true)
		order.text = "Сумма: \(BasketSumm.shared.summ)"
		//setupTableView()
	}

	private func setupTableView() {
		tableView.delegate = self
		tableView.dataSource = self
	}
    

}

extension BasketController: UITableViewDataSource, UITableViewDelegate {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		BasketSumm.shared.basket.values.count
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: BasketCell, for: indexPath) as? BasketCell else { return UITableViewCell() }

		cell.update(name: names[indexPath.row], price: price[indexPath.row])

		return cell
	}


}
