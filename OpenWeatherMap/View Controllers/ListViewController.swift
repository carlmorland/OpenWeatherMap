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

class ListViewController: UITableViewController {
	
	var cities = [City]()

	override func viewDidLoad() {
		super.viewDidLoad()
		
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

	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return cities.count
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let city = cities[indexPath.row]
		
		let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath) as! ListTableViewCell
		cell.iconImageView?.image = UIImage(weatherIcon: city.weather.first!.icon)
		cell.nameLabel?.text = city.name
		cell.tempLabel?.text = "\(Int((city.main.temp - 273.15).rounded()))c"
		
		return cell
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if let detail = segue.destination as? DetailViewController, let cell = sender as? UITableViewCell, let indexPath = tableView.indexPath(for: cell) {
			detail.city = cities[indexPath.row]
		}
	}
}

