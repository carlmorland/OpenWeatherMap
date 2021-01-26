//
//  ListViewController.swift
//  OpenWeatherMap
//
//  Created by Carl Morland on 26/01/2021.
//

import UIKit

let cellReuseIdentifier = "Cell"

let cityIds = [2643743 /* London, UK */,
			   5368361 /* Los Angeles, USA */,
			   5304391 /* Mesa, USA */,
			   2636432 /* Swansea, UK */,
			   3143244 /* Oslo, NO */,
			   1701668 /* Manila, PH */]

class ListViewController: UIViewController, UITableViewDataSource {
	
	var cities = [City]()
	
	@IBOutlet var tableView: UITableView!

	override func viewDidLoad() {
		super.viewDidLoad()
		
		let gradient = CAGradientLayer()
		gradient.frame = view.bounds
		gradient.colors = [#colorLiteral(red: 0.01960784314, green: 0.02745098039, blue: 0.2352941176, alpha: 1).cgColor, #colorLiteral(red: 0.4980392157, green: 0.3137254902, blue: 0.6705882353, alpha: 1).cgColor]
		view.layer.insertSublayer(gradient, at: 0)
		
		APIClient.shared.requestCurrentWeather(for: cityIds) { [weak self] (group, error) in
			if let cities = group?.list {
				self?.cities = cities
				DispatchQueue.main.async {
					self?.tableView.reloadData()
				}
			} else {
				DispatchQueue.main.async {
					self?.showAlert(title: "An error occured")
				}
			}
		}
	}

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return cities.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let city = cities[indexPath.row]
		
		let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath) as! ListTableViewCell
		cell.iconImageView?.image = UIImage(weatherIcon: city.weather.first!.icon)
		cell.nameLabel?.text = city.name
		cell.tempLabel?.text = "\(Int((city.main.temp - 273.15).rounded()))c"
		cell.gradient.colors = UIColor.gradientColors(weatherIcon: city.weather.first!.icon)
		
		return cell
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if let detail = segue.destination as? DetailViewController, let cell = sender as? UITableViewCell, let indexPath = tableView.indexPath(for: cell) {
			detail.city = cities[indexPath.row]
		}
	}
}

