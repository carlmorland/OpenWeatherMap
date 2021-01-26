//
//  CellViewModel.swift
//  OpenWeatherMap
//
//  Created by Carl Morland on 26/01/2021.
//

import Foundation

class CellViewModel {
	
	let icon: String
	let name: String
	let temp: String
	
	init(city: City) {
		icon = city.weather.first!.icon
		name = city.name
		temp = city.main.temp.celsiusString()
	}
}
