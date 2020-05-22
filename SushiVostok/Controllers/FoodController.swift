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

	private let names = ["Суп Том Ям с креветками", "Мисо суп", "Мисо суп с креветками", "Мисо суп с лососем", "Суши сет Релакс (1050 гр)", "Суши сет «Мужской закусон» (930гр)", "Суши сет «Спайси» (1 кг 100гр)", "Суши сет «Снежок» (1 кг 130гр)", "Блэк Спайси", "Чиз Спайси", "Краб Хаус", "КАПА МАКИ", "КАЛИФОРНИЯ", "КАЛИФОРНИЯ С КРЕВЕТКОЙ", "КАЛИФОРНИЯ ЧИКЕН", "КАРМЕН", "Морс облепиховый 0,5 литра" ]
	private let descriptions = ["Состав: Кисло-острый суп с тигровыми креветками, шампиньонами, томатами и луком, с нежным оттенком кокосового молока. Подается с рисом", "Состав: Легкий классический суп на основе мисо пасты с сыром тофу и зеленым лучком", "Состав: Легкий классический суп на основе мисо пасты с креветками и зеленым лучком", "Состав: Легкий классический суп на основе мисо пасты с нежным лососем и зеленым лучком", "Состав: Чиз Спайси, Ниагара, Русский ролл, Вулкан, Краб Хаус", "Состав: Бекон ролл, Русский ролл, Чикен темпура, Чиз спайси, Запеченный Чикен", "Состав: Нори, Рис, Сыр, Лосось, Огурец", "Состав: Блэк Спайси, Тояма ролл, Сэнсей ролл, Острый Кани-Сяке, Острый кальмарчик", "Очень вкусный ролл в ароматном кунжуте, с жареным филе лосося, сливочным сыром и огурчиком, сверху соус Спайси", "Состав: Пикантный ролл обернутый в нежные ломтики сыра, внутри жареное куриное филе, сливочный сыр и огурчик, под соусом", "Состав: Нори, Рис, Краб, Кунжут, Салат, Помидор, Лист салата, Майонез", "Состав: Нори, Рис, Огурец, Кунжут", "Состав: Нори, Рис, Крабовый микс, Огурец, Икра Масаго", "Состав: Нори, Рис, Крабовый микс, Огурец, Масаго", "Состав: Нори, Рис, Сыр, Филе курицы, Огурец, Икра Масаго", "Состав: Нори, Рис, Лист салата, Сыр, Помидор, Икра масаго, Фирменый соус Лава", "Морс облепиховый 0,5 литра"]
	private let prices: [Int] = [269, 179, 239, 229, 499, 599, 799, 799, 179, 179, 179, 80, 195, 210, 185, 195, 69]
	private let images = ["r1", "r2", "r3", "r4", "r5", "r6", "r7", "r8", "r9", "r10", "r11", "r12", "r13", "r14", "r15", "r16", "r20"]

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

	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		if let cell = tableView.cellForRow(at: indexPath) as? FoodCell {

			if BasketSumm.shared.basket[cell.name] == nil {
				BasketSumm.shared.basket[cell.name] = cell.price
				BasketSumm.shared.summ += cell.price
				view.showMessage(text: "\(cell.name) добавлено в корзину")
			} else {
				BasketSumm.shared.basket[cell.name] = nil
				BasketSumm.shared.summ -= cell.price
				view.showMessage(text: "\(cell.name) удалено из корзины")
			}

			print(BasketSumm.shared.basket)
		}
	}


}
