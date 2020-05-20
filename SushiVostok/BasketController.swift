//
//  BasketController.swift
//  SushiVostok
//
//  Created by Eduard Sinyakov on 5/20/20.
//  Copyright © 2020 Eduard Siniakov. All rights reserved.
//

import UIKit

class BasketController: UIViewController {
	private let BasketCell = "BasketCell"

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
    

}


