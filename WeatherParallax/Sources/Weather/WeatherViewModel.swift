//
//  WeatherViewModel.swift
//  WeatherParallax
//
//  Created by Andrew Trach on 02.11.2022.
//

import Foundation
import CoreLocation

protocol WeatherViewModelProtocol: AnyObject {
    func getCell(at indexPath: IndexPath) -> OpenWeather?
    func getCoordinate() -> CLLocation
}

class WeatherViewModel: WeatherViewModelProtocol {
    
    // MARK: - Properties
    var model: OpenWeather
    var city: CityList
    
    init(model: OpenWeather, city: CityList) {
        self.model = model
        self.city = city
    }
    
    func getCell(at indexPath: IndexPath) -> OpenWeather? {
        return model
    }
    
    func getCoordinate() -> CLLocation {
        return CLLocation(latitude: city.coord.lat, longitude: city.coord.lon)
    }
}
