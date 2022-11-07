//
//  WeatherViewModel.swift
//  WeatherParallax
//
//  Created by Andrew Trach on 02.11.2022.
//

import Foundation

protocol WeatherViewModelProtocol: AnyObject {
    var model: OpenWeather? { get set }
    var city: CityList? { get set }
}

class WeatherViewModel: WeatherViewModelProtocol {
    
    // MARK: - Properties
    var model: OpenWeather?
    var city: CityList?
    
    init(model: OpenWeather, city: CityList) {
        self.model = model
        self.city = city
    }
}
