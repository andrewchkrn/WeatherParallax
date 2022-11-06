//
//  TableView.swift
//  ParallaxTableView
//
//  Created by Andrew Trach on 06.11.2022.
//

import UIKit

class ParallaxTableView: UITableView {
    
    // MARK: - @IBAction func
    @IBOutlet private weak var height: NSLayoutConstraint!
    
    // MARK: - Public func
    func animate() {
        guard let header = tableHeaderView else { return }
        let offsetY = -contentOffset.y
        height.constant = max(header.bounds.height, header.bounds.height + offsetY)
    }
}
