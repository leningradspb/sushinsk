//
//  BasketController.swift
//  SushiVostok
//
//  Created by Eduard Sinyakov on 5/20/20.
//  Copyright © 2020 Eduard Siniakov. All rights reserved.
//

import UIKit

class BasketController: UIViewController {
	private let FinalBasketCell = "FinalBasketCell"

	@IBOutlet weak var order: UILabel!
	@IBOutlet weak var tableView: UITableView!

	override func viewDidLoad() {
        super.viewDidLoad()

		setupTableView()

//		//values = BasketSumm.shared.basket.map { $0.value }
//
//		keys = BasketSumm.shared.basket.map { $0.key }
//		tableView.reloadData()
		//let keys = dict.allKeys as? [String]
    }

	private func setupTableView() {
		tableView.delegate = self
		tableView.dataSource = self
	}

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(true)
		order.text = "Сумма: \(BasketSumm.shared.summ)"
		tableView.reloadData()
		//setupTableView()
	}
    

}

extension BasketController: UITableViewDataSource, UITableViewDelegate {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		BasketSumm.shared.names.count
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: FinalBasketCell, for: indexPath) as? FinalBasketCell else { return UITableViewCell() }

		let name = BasketSumm.shared.names[indexPath.row]
		let price = BasketSumm.shared.price[indexPath.row]

		cell.update(name: name, price: price)
		return cell
	}


}


final class ContentSizedTableView: UITableView {
    override var contentSize:CGSize {
        didSet {
            invalidateIntrinsicContentSize()
        }
    }

    override var intrinsicContentSize: CGSize {
        layoutIfNeeded()
        return CGSize(width: UIView.noIntrinsicMetric, height: contentSize.height)
    }
}
