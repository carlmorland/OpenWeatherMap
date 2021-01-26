//
//  Main.swift
//  OpenWeatherMap
//
//  Created by Carl Morland on 26/01/2021.
//

import Foundation

struct Main: Decodable {
	let temp: Kelvin
	let feelsLike: Kelvin
	let tempMin: Kelvin
	let tempMax: Kelvin
}
