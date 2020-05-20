//
//  BasketSumm.swift
//  SushiVostok
//
//  Created by Eduard Sinyakov on 5/20/20.
//  Copyright © 2020 Eduard Siniakov. All rights reserved.
//

import Foundation

class BasketSumm {
	static let shared = BasketSumm()
	var summ = Int()
	var basket: [String: Int] = [:]
}
