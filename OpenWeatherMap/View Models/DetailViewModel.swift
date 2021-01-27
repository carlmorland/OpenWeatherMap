//
//  DetailViewModel.swift
//  OpenWeatherMap
//
//  Created by Carl Morland on 26/01/2021.
//

import Foundation

struct DetailViewModel {
	
	private let city: City
	
	init(city: City) {
		self.city = city
	}
	
	var iconImageName: String {
		city.weather.iconImageName
	}
	
	var temperature: String {
		city.temperatures.current.celsiusString()
	}
	
	var cityName: String {
		city.name
	}
	
	var weatherDescription: String {
		city.weather.description
	}
	
	var feelsLike: String {
		"Feels like \(city.temperatures.feelsLike.celsiusString())"
	}
	
	var highTemp: String {
		"H \(city.temperatures.tempMax.celsiusString())"
	}
	
	var lowTemp: String {
		"L \(city.temperatures.tempMin.celsiusString())"
	}
	
	var backgroundGradient: Gradient {
		city.weather.gradient
	}
}
