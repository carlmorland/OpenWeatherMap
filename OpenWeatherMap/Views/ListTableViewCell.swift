//
//  ListTableViewCell.swift
//  OpenWeatherMap
//
//  Created by Carl Morland on 26/01/2021.
//

import UIKit

class ListTableViewCell: UITableViewCell {
	
	@IBOutlet var containerView: UIView!
	@IBOutlet var iconImageView: UIImageView!
	@IBOutlet var nameLabel: UILabel!
	@IBOutlet var tempLabel: UILabel!
	
	var backgroundGradientLayer: CAGradientLayer!
	
	override func awakeFromNib() {
		containerView.layer.cornerRadius = 7
		containerView.clipsToBounds = true
		
		backgroundGradientLayer = CAGradientLayer()
		backgroundGradientLayer.frame = containerView.bounds
		backgroundGradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
		backgroundGradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
		containerView.layer.insertSublayer(backgroundGradientLayer, at: 0)
	}
	
	func configure(for viewModel: CellViewModel) {
		iconImageView.image = UIImage(named: viewModel.iconImageName)
		nameLabel.text = viewModel.cityName
		tempLabel.text = viewModel.temperature
		backgroundGradientLayer.colors = viewModel.backgroundGradient.colors.cgColors
	}
}
