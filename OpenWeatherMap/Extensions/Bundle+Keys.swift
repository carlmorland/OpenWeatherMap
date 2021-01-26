//
//  Bundle+Keys.swift
//  OpenWeatherMap
//
//  Created by Carl Morland on 26/01/2021.
//

import Foundation

extension Bundle {
	
	var keys: [String: String] {
		guard let path = path(forResource: "Keys", ofType: "plist"), let keys = NSDictionary(contentsOfFile: path) as? [String:String] else {
			fatalError("Keys.plist not found")
		}
		return keys
	}
}
