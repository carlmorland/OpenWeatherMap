//
//  GradientView.swift
//  OpenWeatherMap
//
//  Created by Carl Morland on 27/01/2021.
//

import UIKit

class GradientView: UIView {
	
	override class var layerClass: AnyClass {
		return CAGradientLayer.self
	}
	
	var gradientLayer: CAGradientLayer {
		return layer as! CAGradientLayer
	}
}
