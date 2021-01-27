//
//  ListViewModel.swift
//  OpenWeatherMap
//
//  Created by Carl Morland on 26/01/2021.
//

import Foundation

class ListViewModel {
	
	var cells: Observable<[CellViewModel]> = Observable([])
	var error: Observable<Error?> = Observable(nil)
	
	private let cityIds = [2643743 /* London, UK */, 5368361 /* Los Angeles, USA */, 5304391 /* Mesa, USA */, 2636432 /* Swansea, UK */, 3143244 /* Oslo, NO */, 1701668 /* Manila, PH */]
	
	private var cities = [City]()
	
	private let apiClient: APIClientProtocol
	
	init(apiClient: APIClientProtocol = APIClient()) {
		self.apiClient = apiClient
		apiClient.requestCurrentWeather(for: cityIds) { [weak self] (cities, error) in
			if let cities = cities {
				self?.cities = cities
				self?.cells.value = cities.map { CellViewModel(city: $0) }
			} else {
				self?.error.value = error
			}
		}
	}
	
	func detailViewModel(for row: Int) -> DetailViewModel {
		return DetailViewModel(city: cities[row])
	}
}
