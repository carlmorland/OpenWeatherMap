//
//  City.swift
//  OpenWeatherMap
//
//  Created by Carl Morland on 26/01/2021.
//

import Foundation

struct City: Decodable {
	let weather: [Weather]
	let main: Main
	let name: String
}
