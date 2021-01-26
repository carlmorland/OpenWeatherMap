//
//  UIColor+Weather.swift
//  OpenWeatherMap
//
//  Created by Carl Morland on 26/01/2021.
//

import UIKit

extension UIColor {
	
	static func gradientColors(weatherIcon: String) -> [CGColor] {
		switch weatherIcon {
		case "01d":
			return [#colorLiteral(red: 0.3490196078, green: 0.5764705882, blue: 0.7294117647, alpha: 1).cgColor, #colorLiteral(red: 0.2274509804, green: 0.4509803922, blue: 0.9647058824, alpha: 1).cgColor] // clearDay
		case "01n":
			return [#colorLiteral(red: 0.04705882353, green: 0.07450980392, blue: 0.2117647059, alpha: 1).cgColor, #colorLiteral(red: 0.02352941176, green: 0.1803921569, blue: 0.631372549, alpha: 1).cgColor] // clearNight
		case "02d", "03d", "04d", "09d", "10d", "11d", "13d", "50d":
			return [#colorLiteral(red: 0.5411764706, green: 0.6392156863, blue: 0.7058823529, alpha: 1).cgColor, #colorLiteral(red: 0.2745098039, green: 0.4352941176, blue: 0.8039215686, alpha: 1).cgColor] // stormyDay
		default:
			return [#colorLiteral(red: 0.2588235294, green: 0.3176470588, blue: 0.3607843137, alpha: 1).cgColor, #colorLiteral(red: 0.1882352941, green: 0.4666666667, blue: 0.8, alpha: 1).cgColor] // stormyNight
		}
	}
	
	static func popColor(weatherIcon: String) -> UIColor {
		switch weatherIcon {
		case "01d":
			return #colorLiteral(red: 0.01176470588, green: 0.3568627451, blue: 0.7764705882, alpha: 1) // clear day
		case "01n":
			return #colorLiteral(red: 0.009915085276, green: 0.05808822437, blue: 0.1973809686, alpha: 1) // clear night
		case "02d", "03d", "04d", "09d", "10d", "11d", "13d", "50d":
			return #colorLiteral(red: 0.2932105064, green: 0.4034275413, blue: 0.6109188199, alpha: 1) // stormy day
		default:
			return #colorLiteral(red: 0.1684717834, green: 0.3295314908, blue: 0.5122195482, alpha: 1) // stormy night
		}
	}
}

