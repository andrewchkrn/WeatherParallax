//
//  CityModel.swift
//  WeatherParallax
//
//  Created by Andrew Trach on 01.11.2022.
//

import Foundation

typealias CityModel = [CityList]

// MARK: - CityList
struct CityList: Codable {
    let id: Int
    let name, state, country: String
    let coord: Coord
}

// MARK: - Coord
struct Coord: Codable {
    let lon, lat: Double
}

