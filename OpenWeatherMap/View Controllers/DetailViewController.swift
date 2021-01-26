//
//  DetailViewController.swift
//  OpenWeatherMap
//
//  Created by Carl Morland on 26/01/2021.
//

import UIKit

class DetailViewController: UIViewController {
	
	var city: City!
	
	@IBOutlet var containerView: UIView!
	@IBOutlet var iconImageView: UIImageView!
	@IBOutlet var tempLabel: UILabel!
	@IBOutlet var nameLabel: UILabel!
	@IBOutlet var weatherDescriptionLabel: UILabel!
	@IBOutlet var feelsLikeContainer: UIView!
	@IBOutlet var feelsLikeLabel: UILabel!
	@IBOutlet var highTempLabel: UILabel!
	@IBOutlet var lowTempLabel: UILabel!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		let gradient = CAGradientLayer()
		gradient.frame = view.bounds
		gradient.colors =  UIColor.gradientColors(weatherIcon: city.weather.first!.icon).reversed()
		view.layer.insertSublayer(gradient, at: 0)
		
		let topGradient = CAGradientLayer()
		topGradient.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: 147)
		topGradient.colors =  [#colorLiteral(red: 0.01960784314, green: 0.02745098039, blue: 0.2352941176, alpha: 1).cgColor, #colorLiteral(red: 0.01960784314, green: 0.02745098039, blue: 0.2352941176, alpha: 0).cgColor]
		view.layer.insertSublayer(topGradient, above: gradient)
		
		containerView.backgroundColor = .clear
		containerView.layer.borderWidth = 1.5
		containerView.layer.borderColor = UIColor.white.cgColor
		containerView.layer.cornerRadius = 7
		containerView.clipsToBounds = true
		
		feelsLikeContainer.backgroundColor = UIColor.popColor(weatherIcon: city.weather.first!.icon)
		feelsLikeContainer.layer.cornerRadius = 15
		feelsLikeContainer.clipsToBounds = true
		
		iconImageView.image = UIImage(weatherIcon: city.weather.first!.icon)
		tempLabel.text = "\(Int((city.main.temp - 273.15).rounded()))c"
		nameLabel.text = city.name
		weatherDescriptionLabel.text = city.weather.first!.main
		feelsLikeLabel.text = "Feels like \(Int((city.main.feelsLike - 273.15).rounded()))c"
		highTempLabel.attributedText = attributedTempString("H \(Int((city.main.tempMax - 273.15).rounded()))c")
		lowTempLabel.attributedText = attributedTempString("L \(Int((city.main.tempMin - 273.15).rounded()))c")
	}
	
	/// Sets the first character (e.g. the 'H' in 'H 23c' to be bold
	private func attributedTempString(_ string: String) -> NSAttributedString {
		let attributedString = NSMutableAttributedString(string: string, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15)])
		attributedString.addAttributes([NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 15)], range: NSRange(location: 0, length: 1))
		return attributedString
	}
	
	@IBAction func backButtonPressed() {
		navigationController?.popViewController(animated: true)
	}
}

