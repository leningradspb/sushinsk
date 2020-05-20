//
//  Extension.swift
//  SushiVostok
//
//  Created by Eduard Sinyakov on 5/20/20.
//  Copyright © 2020 Eduard Siniakov. All rights reserved.
//

import UIKit

var messageView: MessageView!

extension UIView {

	func showMessage(text: String?) {
		DispatchQueue.main.async {
			guard let text = text else { return }

			if #available(iOS 11.0, *) {
				let guide = self.safeAreaLayoutGuide
				messageView?.removeFromSuperview()
				messageView = nil

				messageView = MessageView()
				messageView.text = text

				self.addSubview(messageView)

				messageView.translatesAutoresizingMaskIntoConstraints = false
				messageView.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 12).isActive = true
				messageView.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -12).isActive = true
				messageView.bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: -8).isActive = true
			} else {

				let guide = self
				messageView?.removeFromSuperview()
				messageView = nil

				messageView = MessageView()
				messageView.text = text

				self.addSubview(messageView)

				messageView.translatesAutoresizingMaskIntoConstraints = false
				messageView.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 12).isActive = true
				messageView.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -12).isActive = true
				messageView.bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: -8).isActive = true
			}

			UIView.animate(withDuration: 0.5) {
				messageView.alpha = 1
			}

			DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
				messageView.removeFromSuperview()
			}

		}
	}

	func hideMessage() {
		DispatchQueue.main.async {
			messageView?.removeFromSuperview()
			messageView = nil
		}
	}
}

final class MessageView: UITextView {
    private let cornerRadius:  CGFloat = 5

    init() {
        super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0), textContainer: nil)
        setupLayout()
		setupTheme()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupLayout()
		setupTheme()
    }

    override var text: String! {
        didSet {
            sizeToFit()
        }
    }

    override func awakeFromNib() {
        setupLayout()
		setupTheme()
    }

     func setupLayout() {
        layer.cornerRadius = cornerRadius
		font = UIFont.systemFont(ofSize: 15)
        isScrollEnabled = false
        isUserInteractionEnabled = false
    }

     func setupTheme() {

		backgroundColor = #colorLiteral(red: 0, green: 0.5690457821, blue: 0.5746168494, alpha: 1)
        textColor = Colors.shared.white
    }
}

class Colors {
	static let shared = Colors()

	let red = UIColor.rgb(red: 231, green: 76, blue: 50, alpha: 1)
	let white = UIColor.rgb(red: 239, green: 239, blue: 239, alpha: 239)
	let gray = UIColor.rgb(red: 83, green: 83, blue: 83, alpha: 1)
}

extension UIColor {
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) -> UIColor {
        return UIColor(red: red/255.0, green: green/255.0, blue: blue/255.0, alpha: alpha)
    }
}
