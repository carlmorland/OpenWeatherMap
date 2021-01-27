//
//  Weather.swift
//  OpenWeatherMap
//
//  Created by Carl Morland on 26/01/2021.
//

import Foundation

struct Weather: Decodable {
	let description: String
	let icon: WeatherIcon
	
	private enum CodingKeys: String, CodingKey {
		case description = "main"
		case icon
	}
}
