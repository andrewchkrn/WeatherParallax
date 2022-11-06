//
//  CityTableViewCell.swift
//  WeatherParallax
//
//  Created by Andrew Trach on 01.11.2022.
//

import UIKit
import SDWebImage

class CityTableViewCell: UITableViewCell {
    
    // MARK: - @IBAction func
    @IBOutlet private weak var cityImageView: UIImageView!
    @IBOutlet private weak var cityLabel: UILabel!
    
    // MARK: - Public func
    func configure(_ viewModel: CityTableViewModel, index: Int) {
        cityLabel.text = viewModel.name
        cityImageView.sd_setImage(with: viewModel.configure(index: index))
    }
}
