//
//  CellViewModel.swift
//  OpenWeatherMap
//
//  Created by Carl Morland on 26/01/2021.
//

import Foundation

struct CellViewModel {
	
	private let city: City
	
	init(city: City) {
		self.city = city
	}
	
	var iconImageName: String {
		city.weather.iconImageName
	}
	
	var cityName: String {
		city.name
	}
	
	var temperature: String {
		city.temperatures.current.celsiusString()
	}
	
	var backgroundGradient: Gradient {
		city.weather.gradient
	}
}
