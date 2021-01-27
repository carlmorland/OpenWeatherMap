//
//  Temperatures.swift
//  OpenWeatherMap
//
//  Created by Carl Morland on 26/01/2021.
//

import Foundation

struct Temperatures: Decodable {
	let current: Kelvin
	let feelsLike: Kelvin
	let tempMin: Kelvin
	let tempMax: Kelvin
	
	private enum CodingKeys: String, CodingKey {
		case current = "temp"
		case feelsLike
		case tempMin
		case tempMax
	}
}
