//
//  ListViewController.swift
//  OpenWeatherMap
//
//  Created by Carl Morland on 26/01/2021.
//

import UIKit

let cellReuseIdentifier = "Cell"

class ListViewController: UIViewController, UITableViewDataSource {
	
	var viewModel = ListViewModel()
	
	@IBOutlet var tableView: UITableView!

	override func viewDidLoad() {
		super.viewDidLoad()
		
		let gradient = CAGradientLayer()
		gradient.frame = view.bounds
		gradient.colors = [#colorLiteral(red: 0.01960784314, green: 0.02745098039, blue: 0.2352941176, alpha: 1), #colorLiteral(red: 0.4980392157, green: 0.3137254902, blue: 0.6705882353, alpha: 1)].cgColors
		view.layer.insertSublayer(gradient, at: 0)
		
		viewModel.cells.bind { [weak self] _ in
			self?.tableView.reloadData()
		}
		
		viewModel.error.bind { [weak self] error in
			if error != nil {
				print(error.debugDescription)
				self?.showAlert(title: "An error occured")
			}
		}
	}

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return viewModel.cells.value.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath) as! ListTableViewCell
		let cellViewModel = viewModel.cells.value[indexPath.row]
		cell.configure(for: cellViewModel)
		return cell
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if let detail = segue.destination as? DetailViewController, let cell = sender as? UITableViewCell, let indexPath = tableView.indexPath(for: cell) {
			detail.viewModel = viewModel.detailViewModel(for: indexPath.row)
		}
	}
}

