//
//  MockAPIClient.swift
//  OpenWeatherMapTests
//
//  Created by Carl Morland on 27/01/2021.
//

import Foundation

class MockAPIClient: APIClientProtocol {
	
	var isRequestCurrentWeatherCalled = false
	
	var completion: (([City]?, Error?) -> Void)!
	
	func requestCurrentWeather(for cityIds: [Int], completion: @escaping ([City]?, Error?) -> Void) {
		isRequestCurrentWeatherCalled = true
		self.completion = completion
	}
	
	func requestFail(error: Error?) {
		completion(nil, error)
	}
	
	func requestSuccess(cities: [City]) {
		completion(cities, nil)
	}
}
