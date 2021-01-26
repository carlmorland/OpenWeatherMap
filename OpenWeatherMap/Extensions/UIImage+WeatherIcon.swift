//
//  UIImage+WeatherIcon.swift
//  OpenWeatherMap
//
//  Created by Carl Morland on 26/01/2021.
//

import UIKit

extension UIImage {
	
	convenience init?(weatherIcon: String) {
		let name: String
		switch weatherIcon {
		case "01d", "01n":
			name = "Sun"
		case "02d", "02n", "03d", "03n", "04d", "04n":
			name = "Sun and Cloud"
		case "09d", "09n", "10d", "10n":
			name = "Rain"
		case "11d", "11n":
			name = "Thunder"
		case "13d", "13n", "50d", "50n":
			name = "Snow"
		default:
			return nil
		}
		self.init(named: name)
	}
}
