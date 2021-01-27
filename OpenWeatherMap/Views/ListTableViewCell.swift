//
//  ListTableViewCell.swift
//  OpenWeatherMap
//
//  Created by Carl Morland on 26/01/2021.
//

import UIKit

class ListTableViewCell: UITableViewCell {
	
	@IBOutlet var containerView: GradientView!
	@IBOutlet var iconImageView: UIImageView!
	@IBOutlet var nameLabel: UILabel!
	@IBOutlet var tempLabel: UILabel!
	
	override func awakeFromNib() {
		containerView.layer.cornerRadius = 7
		containerView.clipsToBounds = true
		
		containerView.gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
		containerView.gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
	}
	
	func configure(for viewModel: CellViewModel) {
		iconImageView.image = UIImage(named: viewModel.iconImageName)
		nameLabel.text = viewModel.cityName
		tempLabel.text = viewModel.temperature
		containerView.gradientLayer.colors = viewModel.backgroundGradient.colors.cgColors
	}
}
