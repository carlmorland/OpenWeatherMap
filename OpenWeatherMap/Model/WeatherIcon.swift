//
//  WeatherIcon.swift
//  OpenWeatherMap
//
//  Created by Carl Morland on 27/01/2021.
//

import Foundation

enum WeatherIcon: String, Decodable {
	case clearSkyDay = "01d"
	case clearClearNight = "01n"
	case fewCloudsDay = "02d"
	case fewCloudsNight = "02n"
	case scatteredCloudsDay = "03d"
	case scatteredCloudsNight = "03n"
	case brokenCloudsDay = "04d"
	case brokenCloudsNight = "04n"
	case showerRainDay = "09d"
	case showerRainNight = "09n"
	case rainDay = "10d"
	case rainNight = "10n"
	case thunderstormDay = "11d"
	case thunderstormNight = "11n"
	case snowDay = "13d"
	case snowNight = "13n"
	case mistDay = "50d"
	case mistNight = "50n"
}
