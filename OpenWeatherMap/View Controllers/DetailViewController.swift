//
//  DetailViewController.swift
//  OpenWeatherMap
//
//  Created by Carl Morland on 26/01/2021.
//

import UIKit

class DetailViewController: UIViewController {
	
	var city: City!
	
	@IBOutlet var iconImageView: UIImageView!
	@IBOutlet var tempLabel: UILabel!
	@IBOutlet var nameLabel: UILabel!
	@IBOutlet var weatherDescriptionLabel: UILabel!
	@IBOutlet var feelsLikeLabel: UILabel!
	@IBOutlet var highTempLabel: UILabel!
	@IBOutlet var lowTempLabel: UILabel!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		iconImageView.image = UIImage(weatherIcon: city.weather.first!.icon)
		tempLabel.text = "\(Int((city.main.temp - 273.15).rounded()))c"
		nameLabel.text = city.name
		weatherDescriptionLabel.text = city.weather.first!.main
		feelsLikeLabel.text = "Feels like \(Int((city.main.feelsLike - 273.15).rounded()))c"
		highTempLabel.text = "H \(Int((city.main.tempMax - 273.15).rounded()))c"
		lowTempLabel.text = "L \(Int((city.main.tempMin - 273.15).rounded()))c"
	}
	
	@IBAction func backButtonPressed() {
		navigationController?.popViewController(animated: true)
	}
}

