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

	private let names1 = ["КАМЕЛИЯ", "АЛЯСКА", "БЕЛАЯ ФИЛАДЕЛЬФИЯ", "БИГ ФИЛАДЕЛЬФИЯ", "БОНИТО", "ВОСХОД", "ГЕЙША", "ДРАКОН", "ЕВА", "ИНЬ-ЯНЬ", "ЙОДЖИ", "КАПА МАКИ", "КАЛИФОРНИЯ", "КАЛИФОРНИЯ С КРЕВЕТКОЙ", "КАЛИФОРНИЯ ЧИКЕН", "КАРМЕН" ]
	private let descriptions = ["Состав: нори, рис, омлет, жареная кожа семги,помидор, кунжут, сыр хохланд, икра масага", "Состав: Нори, Рис, Лосось, Лук, Огурец, Сыр, Кунжут", "Состав: Нори, Рис, Сыр, Огурец, Эсколар, соус унаги,кунжут", "Состав: Нори, Рис, Сыр, Сёмга, Огурец, Красная икра", "Состав: Нори, Рис, Сыр, Угорь, Стружка, Огурец", "Состав: Нори, Рис, Сыр, Масаго, Креветка, Огурец", "Состав: Нори, Рис, Сыр, Лосось, Огурец", "Состав: Нори, Рис, Креветка, Крабовый микс, Масаго", "Состав: Нори, Рис, Зеленое яблоко, Лист салата латук, Семя кунжута, Соус Унаги", "Состав: Нори, Рис,Угорь, Семга", "Состав: Нори, Рис, Краб, Кунжут, Салат, Помидор, Лист салата, Майонез", "Состав: Нори, Рис, Огурец, Кунжут", "Состав: Нори, Рис, Крабовый микс, Огурец, Икра Масаго", "Состав: Нори, Рис, Крабовый микс, Огурец, Масаго", "Состав: Нори, Рис, Сыр, Филе курицы, Огурец, Икра Масаго", "Состав: Нори, Рис, Лист салата, Сыр, Помидор, Икра масаго, Фирменый соус Лава"]
	private let prices: [Int] = [220, 195, 189, 340, 195, 189, 195, 210, 133, 210, 195, 80, 195, 210, 185, 195]
	private let images = ["r1", "r2", "r3", "r4", "r5", "r6", "r7", "r8", "r9", "r10", "r11", "r12", "r13", "r14", "r15", "r16"]

    override func viewDidLoad() {
        super.viewDidLoad()
		setupTableView()
		print(names.count, descriptions.count)
    }

	private func setupTableView() {
		tableView.delegate = self
		tableView.dataSource = self
	}

}

extension FoodController: UITableViewDataSource, UITableViewDelegate {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		names1.count
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: FoodCell, for: indexPath) as? FoodCell else { return UITableViewCell() }

		let image = images[indexPath.row]
		let name = names1[indexPath.row]
		let price = prices[indexPath.row]
		let description = descriptions[indexPath.row]

		cell.update(food: Food(name: name, description: description, price: price, image: image))
		return cell
	}

	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		357
	}

	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		if let cell = tableView.cellForRow(at: indexPath) as? FoodCell {

			if BasketSumm.shared.basket[cell.name] == nil {
				BasketSumm.shared.basket[cell.name] = cell.price
				BasketSumm.shared.summ += cell.price
				price.append(cell.price)
				names.append(cell.name)
				view.showMessage(text: "\(cell.name) добавлено в корзину")
			} else {
				BasketSumm.shared.basket[cell.name] = nil
				BasketSumm.shared.summ -= cell.price
				names.removeAll { (str) -> Bool in
					str == cell.name
				}

				names.removeAll { (str) -> Bool in
					str == String(cell.price)
				}
				view.showMessage(text: "\(cell.name) удалено из корзины")
			}

			print(BasketSumm.shared.basket)
		}
	}


}
