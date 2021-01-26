//
//  DetailViewController.swift
//  OpenWeatherMap
//
//  Created by Carl Morland on 26/01/2021.
//

import UIKit

class DetailViewController: UIViewController {
	
	var viewModel: Observable<DetailViewModel?> = Observable(nil)
	
	@IBOutlet var containerView: UIView!
	@IBOutlet var iconImageView: UIImageView!
	@IBOutlet var tempLabel: UILabel!
	@IBOutlet var nameLabel: UILabel!
	@IBOutlet var weatherDescriptionLabel: UILabel!
	@IBOutlet var feelsLikeContainer: UIView!
	@IBOutlet var feelsLikeLabel: UILabel!
	@IBOutlet var highTempLabel: UILabel!
	@IBOutlet var lowTempLabel: UILabel!
	
	private var gradient: CAGradientLayer!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		gradient = CAGradientLayer()
		gradient.frame = view.bounds
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
		
		feelsLikeContainer.layer.cornerRadius = 15
		feelsLikeContainer.clipsToBounds = true
		
		viewModel.bind { [weak self] (viewModel) in
			guard let self = self, let viewModel = viewModel else {
				return
			}
			self.gradient.colors =  UIColor.gradientColors(weatherIcon: viewModel.icon).reversed()
			self.feelsLikeContainer.backgroundColor = UIColor.popColor(weatherIcon: viewModel.icon)
			self.iconImageView.image = UIImage(weatherIcon: viewModel.icon)
			self.tempLabel.text = viewModel.temp
			self.nameLabel.text = viewModel.name
			self.weatherDescriptionLabel.text = viewModel.weatherDescription
			self.feelsLikeLabel.text = viewModel.feelsLike
			self.highTempLabel.attributedText = self.format(viewModel.highTemp)
			self.lowTempLabel.attributedText = self.format(viewModel.lowTemp)
		}
	}
	
	/// Sets the first character (e.g. the 'H' in 'H 23c') to be bold
	private func format(_ string: String) -> NSAttributedString {
		let attributedString = NSMutableAttributedString(string: string, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15)])
		attributedString.addAttributes([NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 15)], range: NSRange(location: 0, length: 1))
		return attributedString
	}
	
	@IBAction func backButtonPressed() {
		navigationController?.popViewController(animated: true)
	}
}

