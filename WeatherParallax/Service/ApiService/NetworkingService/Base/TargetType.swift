//
//  TargetType.swift
//  WeatherParallax
//
//  Created by Andrew Trach on 29.10.2022.
//

import Foundation

    // MARK: - TargetType
protocol TargetType {

    // MARK: - Properties
    var baseURL: String {get}
    var path: String {get}
    var method: HTTPMethod {get}
    var task: Task {get}
    var headers: [String: String]? {get}
}
