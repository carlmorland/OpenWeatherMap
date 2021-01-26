//
//  APIClient.swift
//  OpenWeatherMap
//
//  Created by Carl Morland on 26/01/2021.
//

import Foundation

class APIClient {
	
	static let shared = APIClient()
	
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
	
	func requestCurrentWeather(for cityIds: [Int], completion: @escaping (Group?, Error?) -> Void) {
		let cityIdsCommaSeparatedString = cityIds.map{ String($0) }.joined(separator: ",")
		let url = URL(string: baseURL + "/group?id=\(cityIdsCommaSeparatedString)&appid=\(apiKey)")!
		
		let task = URLSession.shared.dataTask(with: url, completionHandler: { data, _, error in
			if let data = data {
				do {
					let group = try self.jsonDecoder.decode(Group.self, from: data)
					completion(group, nil)
				} catch {
					completion(nil, error)
				}
			} else {
				completion(nil, error)
			}
		})
		
		task.resume()
	}
}
