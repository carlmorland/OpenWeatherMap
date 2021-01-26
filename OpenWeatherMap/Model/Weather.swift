//
//  Weather.swift
//  OpenWeatherMap
//
//  Created by Carl Morland on 26/01/2021.
//

import Foundation

struct Weather: Decodable {
	let main: String
	let icon: String
}
