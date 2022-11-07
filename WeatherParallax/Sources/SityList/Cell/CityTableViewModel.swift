//
//  CityTableViewModel.swift
//  WeatherParallax
//
//  Created by Andrew Trach on 06.11.2022.
//

import Foundation

class CityTableViewModel {
    
    struct Const {
        static let first: String = "https://infotech.gov.ua/storage/img/Temp3.png"
        static let second: String = "https://infotech.gov.ua/storage/img/Temp1.png"
    }
    
    // MARK: - Properties
    private let model: CityList
    
    // MARK: - Output
    let name: String?
    
    init(_ model: CityList) {
        self.model = model
        self.name = model.name
    }
    
    // MARK: - Public func
    func configure(index: Int) -> URL? {
        let indexIsEven = (index % 2 == 0)
        let first = URL(string: Const.first)
        let second = URL(string: Const.second)
        return indexIsEven ? first : second
    }
}
