//
//  WeatherTableViewCell.swift
//  WeatherParallax
//
//  Created by Andrew Trach on 06.11.2022.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {
    
    // MARK: - @IBAction func
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var curretTempLabel: UILabel!
    @IBOutlet private weak var minTempLabel: UILabel!
    @IBOutlet private weak var airHumidityLabel: UILabel!
    @IBOutlet private weak var maxTempLabel: UILabel!
    @IBOutlet private weak var windSpeedLabel: UILabel!
    
    // MARK: - Public func
    func configure(_ viewModel: WeatherCellViewModel) {
        descriptionLabel.text = viewModel.description
        curretTempLabel.text = viewModel.temp
        minTempLabel.text = viewModel.min
        maxTempLabel.text = viewModel.max
        windSpeedLabel.text = viewModel.windSpeed
        airHumidityLabel.text = viewModel.humidity
    }
}
