//
//  Main.swift
//  OpenWeatherMap
//
//  Created by Carl Morland on 26/01/2021.
//

import Foundation

struct Main: Decodable {
	let temp: Double
	let feelsLike: Double
	let tempMin: Double
	let tempMax: Double
}
