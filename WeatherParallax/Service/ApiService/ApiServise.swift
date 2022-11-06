//
//  ApiServiseProtocol.swift
//  WeatherParallax
//
//  Created by Andrew Trach on 29.10.2022.
//

import Foundation
import Alamofire

// MARK: - ApiServiseProtocol
protocol ApiServiseProtocol {
    func getWeather(form: OpenWeatherForm, completionHandler: @escaping (Result<OpenWeather, NSError>) -> Void)
}

// MARK: - ApiServise
class ApiServise: NetworkingBaseService<Networking>, ApiServiseProtocol {
    
    func getWeather(form: OpenWeatherForm, completionHandler: @escaping (Result<OpenWeather, NSError>) -> Void) {
        self.fetchData(target: .getWeather(form: form), responseClass: OpenWeather.self) { (result) in
            completionHandler(result)
        }
    }
}
