//
//  SuccessController.swift
//  SushiVostok
//
//  Created by Eduard Sinyakov on 5/20/20.
//  Copyright © 2020 Eduard Siniakov. All rights reserved.
//

import UIKit

class SuccessController: UIViewController {

	@IBOutlet weak var finalLabel: UILabel!
	@IBAction func waitTapped(_ sender: UIButton) {

		self.dismiss(animated: true, completion: nil)
	}
	override func viewDidLoad() {
        super.viewDidLoad()

		finalLabel.text = "Заказ № \(arc4random()) будет доставлен в течение 45 минут!"

       BasketSumm.shared.summ = 0
		BasketSumm.shared.basket = [:]
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
