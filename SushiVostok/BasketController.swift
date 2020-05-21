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
	@IBOutlet weak var scrollOutlet: UIScrollView!

	override func viewDidLoad() {
        super.viewDidLoad()

		setupTableView()
		registerForKeyboardNotification()
		recognizer(for: scrollOutlet, action: #selector(onTap))

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
	}

	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		view.endEditing(true)
	}

	private func recognizer(for view: UIView, action: Selector?) {
		let singleTapGestureRecognizer = UITapGestureRecognizer(target: self, action: action)

		singleTapGestureRecognizer.numberOfTapsRequired = 1
		singleTapGestureRecognizer.isEnabled = true
		singleTapGestureRecognizer.cancelsTouchesInView = false

		view.isUserInteractionEnabled = true
		view.addGestureRecognizer(singleTapGestureRecognizer)
	}

	@objc private func onTap() {
		self.view.endEditing(true)
	}

	// MARK: - Keyboard apper block

	private func registerForKeyboardNotification() {
		NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)

		NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)

	}

	@objc private func keyboardWillShow(_ notification: Notification) {

		if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
			let keyboardRectangle = keyboardFrame.cgRectValue
			let _ = keyboardRectangle.height

			self.view.transform = CGAffineTransform(translationX: 0, y: -130)
		}

	}

	@objc private func keyboardWillHide() {
		self.view.transform = CGAffineTransform(translationX: 0, y: 0)
	}

	private func removeKeyboardObservers() {

		NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)

		NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
	}

	deinit {
		removeKeyboardObservers()
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
