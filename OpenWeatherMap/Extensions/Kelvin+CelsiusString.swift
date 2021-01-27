//
//  Kelvin+CelsiusString.swift
//  OpenWeatherMap
//
//  Created by Carl Morland on 26/01/2021.
//

import Foundation

private let absoluteZero = -273.15

extension Kelvin {
	
	/// returns a formatted Celsius string (e.g. "23c")
	
	func celsiusString() -> String {
		"\(Int((absoluteZero + self).rounded()))c"
	}
}

