//
//  Task.swift
//  WeatherParallax
//
//  Created by Andrew Trach on 29.10.2022.
//

import Foundation
import Alamofire

    // MARK: - Task
enum Task {
    case requestPlain
    case requestParameters(parameters: [String: Any], encoding: ParameterEncoding)
}
