//
//  APIClient.swift
//  OpenWeatherMap
//
//  Created by Carl Morland on 26/01/2021.
//

import Foundation

protocol APIClientProtocol {
	func requestCurrentWeather(for cityIds: [Int], completion: @escaping ([City]?, Error?) -> Void)
}

class APIClient: APIClientProtocol {
	
	private let baseURL = "https://api.openweathermap.org/data/2.5"
	
	private let apiKey: String = {
		guard let key = Bundle.main.keys["OpenWeatherMapAPIKey"], !key.isEmpty else {
			fatalError("Missing or invalid value for 'OpenWeatherMapAPIKey', please check Keys.plist")
		}
		return key
	}()
	
	private var jsonDecoder: JSONDecoder = {
		let jsonDecoder = JSONDecoder()
		jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
		return jsonDecoder
	}()
	
	private struct Group: Decodable {
		let cities: [City]
		
		private enum CodingKeys: String, CodingKey {
			case cities = "list"
		}
	}
	
	func requestCurrentWeather(for cityIds: [Int], completion: @escaping ([City]?, Error?) -> Void) {
		let cityIdsCommaSeparatedString = cityIds.map{ String($0) }.joined(separator: ",")
		let url = URL(string: baseURL + "/group?id=\(cityIdsCommaSeparatedString)&appid=\(apiKey)")!
		
		let task = URLSession.shared.dataTask(with: url, completionHandler: { data, _, error in
			var cities: [City]?, _error: Error?
			if let data = data {
				do {
					let group = try self.jsonDecoder.decode(Group.self, from: data)
					cities = group.cities
				} catch {
					_error = error
				}
			} else {
				_error = error
			}
			DispatchQueue.main.async {
				completion(cities, _error)
			}
		})
		
		task.resume()
	}
}
