//
//  ListTableViewCell.swift
//  OpenWeatherMap
//
//  Created by Carl Morland on 26/01/2021.
//

import UIKit

class ListTableViewCell: UITableViewCell {
	
	var viewModel: Observable<CellViewModel?> = Observable(nil)
	
	@IBOutlet var containerView: UIView!
	@IBOutlet var iconImageView: UIImageView!
	@IBOutlet var nameLabel: UILabel!
	@IBOutlet var tempLabel: UILabel!
	
	var gradient: CAGradientLayer!
	
	override func awakeFromNib() {
		containerView.layer.cornerRadius = 7
		containerView.clipsToBounds = true
		
		gradient = CAGradientLayer()
		gradient.frame = containerView.bounds
		gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
		gradient.endPoint = CGPoint(x: 1.0, y: 0.5)
		containerView.layer.insertSublayer(gradient, at: 0)
		
		viewModel.bind { [weak self] viewModel in
			guard let viewModel = viewModel, let self = self else {
				return
			}
			self.iconImageView?.image = UIImage(weatherIcon: viewModel.icon)
			self.nameLabel?.text = viewModel.name
			self.tempLabel?.text = viewModel.temp
			self.gradient.colors = UIColor.gradientColors(weatherIcon: viewModel.icon)
		}
	}
}
