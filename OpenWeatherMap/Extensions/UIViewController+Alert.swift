//
//  UIViewController+Alert.swift
//  OpenWeatherMap
//
//  Created by Carl Morland on 26/01/2021.
//

import UIKit

extension UIViewController {
	
	func showAlert(title: String) {
		let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
		present(alert, animated: true, completion: nil)
	}
}
