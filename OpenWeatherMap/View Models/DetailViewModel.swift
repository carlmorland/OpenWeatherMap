//
//  DetailViewModel.swift
//  OpenWeatherMap
//
//  Created by Carl Morland on 26/01/2021.
//

import Foundation

struct DetailViewModel {
	
	let icon: String
	let temp: String
	let name: String
	let weatherDescription: String
	let feelsLike: String
	let highTemp: String
	let lowTemp: String
	
	init(city: City) {
		icon = city.weather.first!.icon
		temp = city.main.temp.celsiusString()
		name = city.name
		weatherDescription = city.weather.first!.main
		feelsLike = "Feels like " + city.main.feelsLike.celsiusString()
		highTemp = "H " + city.main.tempMax.celsiusString()
		lowTemp = "L " + city.main.tempMin.celsiusString()
	}
}
