//
//  OpenWeatherMapTests.swift
//  OpenWeatherMapTests
//
//  Created by Carl Morland on 26/01/2021.
//

import XCTest
@testable import OpenWeatherMap

private enum TestError: Error {
	case unknownError
}

class OpenWeatherMapTests: XCTestCase {
	
	var mockAPIClient: MockAPIClient!
	var listViewModel: ListViewModel!

    override func setUp() {
		super.setUp()
		mockAPIClient = MockAPIClient()
		listViewModel = ListViewModel(apiClient: mockAPIClient)
    }

    override func tearDown() {
		mockAPIClient = nil
		listViewModel = nil
		super.tearDown()
    }

    func testRequestCurrentWeatherCalled() {
		XCTAssert(mockAPIClient.isRequestCurrentWeatherCalled)
    }
	
	let cities = [City(weather: Weather(description: "Clear", icon: .clearSkyDay), temperatures: Temperatures(current: 282.26, feelsLike: 280.01, tempMin: 281.48, tempMax: 283.15), name: "London")]

	func testRequestCurrentWeatherSuccess() {
		mockAPIClient.requestSuccess(cities: cities)
		XCTAssertFalse(listViewModel.cells.value.isEmpty)
		XCTAssertNil(listViewModel.error.value)
	}
	
	func testRequestCurrentWeatherFail() {
		mockAPIClient.requestFail(error: TestError.unknownError)
		XCTAssert(listViewModel.cells.value.isEmpty)
		XCTAssertNotNil(listViewModel.error.value)
	}
	
	func testCellViewModel() {
		mockAPIClient.requestSuccess(cities: cities)
		let cellViewModel = listViewModel.cells.value[0]
		XCTAssert(cellViewModel.iconImageName == "Sun")
		XCTAssert(cellViewModel.cityName == "London")
		XCTAssert(cellViewModel.temperature == "9c")
		XCTAssert(cellViewModel.backgroundGradient == .clearDay)
	}
	
	func testDetailViewModel() {
		mockAPIClient.requestSuccess(cities: cities)
		let detailViewModel = listViewModel.detailViewModel(for: 0)
		XCTAssert(detailViewModel.iconImageName == "Sun")
		XCTAssert(detailViewModel.cityName == "London")
		XCTAssert(detailViewModel.temperature == "9c")
		XCTAssert(detailViewModel.weatherDescription == "Clear")
		XCTAssert(detailViewModel.feelsLike == "Feels like 7c")
		XCTAssert(detailViewModel.highTemp == "H 10c")
		XCTAssert(detailViewModel.lowTemp == "L 8c")
		XCTAssert(detailViewModel.backgroundGradient == .clearDay)
	}
	
	func testKelvinCelsiusString() {
		let temp: Kelvin = 293
		XCTAssert(temp.celsiusString() == "20c")
	}
}
