//
//  City.swift
//  OpenWeatherMap
//
//  Created by Carl Morland on 26/01/2021.
//

import Foundation

struct City: Decodable {
	let weather: Weather
	let temperatures: Temperatures
	let name: String
	
	private enum CodingKeys: String, CodingKey {
		case weather
		case temperatures = "main"
		case name
	}
	
	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		guard let weather = try values.decode([Weather].self, forKey: .weather).first else {
			throw DecodingError.emptyWeatherArray
		}
		self.weather = weather
		temperatures = try values.decode(Temperatures.self, forKey: .temperatures)
		name = try values.decode(String.self, forKey: .name)
	}
	
	enum DecodingError: Error {
		case emptyWeatherArray
	}
}
