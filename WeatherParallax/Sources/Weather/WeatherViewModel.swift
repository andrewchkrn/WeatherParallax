//
//  WeatherViewModel.swift
//  WeatherParallax
//
//  Created by Andrew Trach on 02.11.2022.
//

import Foundation

class WeatherViewModel {
    
    // MARK: - Properties
    private(set) var model: OpenWeather?
    private(set) var city: CityList?
    
    init(model: OpenWeather, city: CityList) {
        self.model = model
        self.city = city
    }
}
