//
//  AppCoordinator.swift
//  WeatherParallax
//
//  Created by Andrew Trach on 29.10.2022.
//

import UIKit

protocol AppCoordinatorProtocol {
    func showMain()
    func showWeather(model: OpenWeather, city: CityList)
}

class AppCoordinator: CoordinatorProtocol {
    
    var parentCoordinator: CoordinatorProtocol?
    var children: [CoordinatorProtocol] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        showMain()
    }
}

extension AppCoordinator: AppCoordinatorProtocol {
    func showMain() {
        let vc = SityListViewController.createObject(nameStoryboard: "SityList")
        let viewModel = SityListViewModel(model: CityModel())
        viewModel.view = vc
        vc.viewModel = viewModel
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func showWeather(model: OpenWeather, city: CityList) {
        let vc = WeatherTableViewController.createObject(nameStoryboard: "Weather")
        let viewModel = WeatherViewModel(model: model, city: city)
        vc.viewModel = viewModel
        navigationController.pushViewController(vc, animated: true)
    }
}
