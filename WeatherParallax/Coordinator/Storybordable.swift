//
//  Storybordable.swift
//  WeatherParallax
//
//  Created by Andrew Trach on 29.10.2022.
//

import UIKit

protocol Storybordable {
    static func createObject(nameStoryboard: String) -> Self
}

extension Storybordable {
    static func createObject(nameStoryboard: String) -> Self {
        let id = String(describing: self)
        let storyboard = UIStoryboard(name: nameStoryboard, bundle: nil)
        return storyboard.instantiateViewController(identifier: id) as! Self
    }
}
