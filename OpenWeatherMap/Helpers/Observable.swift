//
//  Observable.swift
//  OpenWeatherMap
//
//  Created by Carl Morland on 26/01/2021.
//

import Foundation

class Observable<T> {
	
	var value: T {
		didSet {
			listener?(value)
		}
	}
	
	private var listener: ((T) -> Void)?
	
	init(_ value: T) {
		self.value = value
	}
	
	func bind(_ closure: @escaping (T) -> Void) {
		self.listener = closure
		closure(value)
	}
}
