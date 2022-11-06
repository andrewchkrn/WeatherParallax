//
//  WeatherCellViewModel.swift
//  WeatherParallax
//
//  Created by Andrew Trach on 06.11.2022.
//

import Foundation

class WeatherCellViewModel {
    
    // MARK: - Properties
    private let model: OpenWeather
    
    // MARK: - Output
    var temp: String?
    var description: String?
    var min: String?
    var max: String?
    var windSpeed: String?
    var humidity: String?
    
    init(_ model: OpenWeather) {
        self.model = model
        configure()
    }
    
    // MARK: - Private func
    private func configure() {
        self.temp = String((model.current.temp.exponent)) + "°C"
        guard let daily = model.daily.first else { return }
        guard let weather = daily.weather.first else { return }
        self.description = weather.weatherDescription
        self.min = "\(daily.temp.min)"
        self.max = "\(daily.temp.max)"
        self.windSpeed = "\(model.current.windSpeed)"
        self.humidity = "\(model.current.humidity)"
    }
}
