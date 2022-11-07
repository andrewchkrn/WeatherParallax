//
//  SityListViewController.swift
//  WeatherParallax
//
//  Created by Andrew Trach on 29.10.2022.
//

import UIKit

class SityListViewController: UIViewController, Storybordable {
    
    struct Const {
        static let nibName: String = "CityTableViewCell"
        static let forCellReuseIdentifier: String = "city"
    }
    
    // MARK: - @IBAction func
    @IBOutlet private weak var searchBar: UISearchBar!
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Properties
    weak var coordinator: (CoordinatorProtocol & AppCoordinatorProtocol)?
    var viewModel: SityListViewModelProtocol!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.viewDidLoad()
        setupTableView()
    }
    
    // MARK: - Private func
    private func setupTableView() {
        tableView.register(UINib(nibName: Const.nibName, bundle: nil), forCellReuseIdentifier: Const.forCellReuseIdentifier)
    }
}
// MARK: - SityListViewProtocol
extension SityListViewController: SityListViewProtocol {
    func openNextScreen(model: OpenWeather, city: CityList) {
        coordinator?.showWeather(model: model, city: city)
    }
}

//MARK: - UISearchbar delegate
extension SityListViewController: UISearchBarDelegate{
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        viewModel.isSearch = true
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        viewModel.isSearch = false
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        viewModel.isSearch = false
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        viewModel.isSearch = false
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.count == 0 {
            viewModel.isSearch = false
            self.tableView.reloadData()
        } else {
            viewModel.filterText(searchText: searchText)
            self.tableView.reloadData()
        }
    }
}
// MARK: - UITableViewDataSource, UITableViewDelegate
extension SityListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.isSearch ? viewModel.filteredTableData.count : viewModel.model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: Const.forCellReuseIdentifier, for: indexPath) as? CityTableViewCell {
            if let model = viewModel.isSearch ? viewModel?.filteredTableData[indexPath.row] : viewModel?.model[indexPath.row] {
                cell.configure(CityTableViewModel(model), index: indexPath.row)
            }
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = viewModel.model[indexPath.row]
        viewModel.nextButtonTapped(model: OpenWeatherForm(lat: model.coord.lat, lon: model.coord.lon), city: model)
    }
}
