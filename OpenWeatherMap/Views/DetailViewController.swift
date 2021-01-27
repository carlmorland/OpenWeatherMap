//
//  DetailViewController.swift
//  OpenWeatherMap
//
//  Created by Carl Morland on 26/01/2021.
//

import UIKit

class DetailViewController: UIViewController {
	
	var viewModel: DetailViewModel!
	
	@IBOutlet var containerView: UIView!
	@IBOutlet var iconImageView: UIImageView!
	@IBOutlet var tempLabel: UILabel!
	@IBOutlet var nameLabel: UILabel!
	@IBOutlet var weatherDescriptionLabel: UILabel!
	@IBOutlet var feelsLikeContainer: UIView!
	@IBOutlet var feelsLikeLabel: UILabel!
	@IBOutlet var highTempLabel: UILabel!
	@IBOutlet var lowTempLabel: UILabel!
	
	var backgroundGradientLayer: CAGradientLayer!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		backgroundGradientLayer = CAGradientLayer()
		backgroundGradientLayer.frame = view.bounds
		view.layer.insertSublayer(backgroundGradientLayer, at: 0)
		
		let headerGradientLayer = CAGradientLayer()
		headerGradientLayer.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: 147)
		headerGradientLayer.colors =  [#colorLiteral(red: 0.01960784314, green: 0.02745098039, blue: 0.2352941176, alpha: 1).cgColor, #colorLiteral(red: 0.01960784314, green: 0.02745098039, blue: 0.2352941176, alpha: 0).cgColor]
		view.layer.insertSublayer(headerGradientLayer, above: backgroundGradientLayer)
		
		containerView.backgroundColor = .clear
		containerView.layer.borderWidth = 1.5
		containerView.layer.borderColor = UIColor.white.cgColor
		containerView.layer.cornerRadius = 7
		containerView.clipsToBounds = true
		
		feelsLikeContainer.layer.cornerRadius = 15
		feelsLikeContainer.clipsToBounds = true
		
		backgroundGradientLayer.colors =  viewModel.backgroundGradient.colors.cgColors.reversed()
		feelsLikeContainer.backgroundColor = viewModel.backgroundGradient.overlayColor
		iconImageView.image = UIImage(named: viewModel.iconImageName)
		tempLabel.text = viewModel.temperature
		nameLabel.text = viewModel.cityName
		weatherDescriptionLabel.text = viewModel.weatherDescription
		feelsLikeLabel.text = viewModel.feelsLike
		highTempLabel.attributedText = formattedString(for: viewModel.highTemp)
		lowTempLabel.attributedText = formattedString(for: viewModel.lowTemp)
	}
	
	/// Sets the first character to be bold
	
	private func formattedString(for string: String) -> NSAttributedString {
		let attributedString = NSMutableAttributedString(string: string, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15)])
		attributedString.addAttributes([NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 15)], range: NSRange(location: 0, length: 1))
		return attributedString
	}
	
	@IBAction func backButtonPressed() {
		navigationController?.popViewController(animated: true)
	}
}

