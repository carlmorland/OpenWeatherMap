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
	
	init() {
		APIClient.shared.requestCurrentWeather(for: cityIds) { [weak self] (group, error) in
			if let cities = group?.list {
				self?.cities = cities
				DispatchQueue.main.async {
					self?.cells.value = cities.map { CellViewModel(city: $0) }
				}
			} else {
				DispatchQueue.main.async {
					self?.error.value = error
				}
			}
		}
	}
	
	func detailViewModel(for row: Int) -> DetailViewModel {
		return DetailViewModel(city: cities[row])
	}
}
