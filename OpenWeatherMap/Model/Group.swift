//
//  Group.swift
//  OpenWeatherMap
//
//  Created by Carl Morland on 26/01/2021.
//

import Foundation

struct Group: Decodable {
	let list: [City]
}
