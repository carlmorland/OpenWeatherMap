//
//  UIImage+WeatherIcon.swift
//  OpenWeatherMap
//
//  Created by Carl Morland on 26/01/2021.
//

import UIKit

extension Weather {
	
	/// The image used is based on the weather icon code  e.g. Sun is used for clearSkyDay (01d)
	
	var iconImageName: String {
		switch icon {
		case .clearSkyDay, .clearClearNight:
			return "Sun"
		case .fewCloudsDay, .fewCloudsNight, .scatteredCloudsDay, .scatteredCloudsNight, .brokenCloudsDay, .brokenCloudsNight:
			return "Sun and Cloud"
		case .showerRainDay, .showerRainNight, .rainDay, .rainNight:
			return "Rain"
		case .thunderstormDay, .thunderstormNight:
			return "Thunder"
		case .snowDay, .snowNight, .mistDay, .mistNight:
			return "Snow"
		}
	}
}
