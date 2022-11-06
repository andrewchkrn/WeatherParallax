//
//  OpenWeatherForm.swift
//  WeatherParallax
//
//  Created by Andrew Trach on 29.10.2022.
//

import Foundation

    //MARK: - OpenWeatherForm
 struct OpenWeatherForm: Encodable {
    
    // MARK: - Types
    private enum CodingKeys: String, CodingKey {
        case lat = "lat"
        case lon = "lon"
        case units = "units"
        case appid = "appid"
    }
    
    // MARK: - Properties
    private(set) var lat: Double
    private(set) var lon: Double
    private(set) var units: String = "metric"
    private(set) var appid: String = "302e191e99e95526eb0573f8af51d5b9"
    
    // MARK: - Initialization
    init(lat: Double, lon: Double) {
        self.lat = lat
        self.lon = lon
    }
}
