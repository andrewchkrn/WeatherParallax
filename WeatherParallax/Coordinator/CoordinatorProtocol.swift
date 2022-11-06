//
//  CoordinatorProtocol.swift
//  WeatherParallax
//
//  Created by Andrew Trach on 29.10.2022.
//

import UIKit

protocol CoordinatorProtocol: AnyObject {
    var parentCoordinator: CoordinatorProtocol? { get set }
    var children: [CoordinatorProtocol] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
}
