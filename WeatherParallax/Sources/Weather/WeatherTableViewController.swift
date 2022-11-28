//
//  WeatherTableViewController.swift
//  WeatherParallax
//
//  Created by Andrew Trach on 02.11.2022.
//

import UIKit
import MapKit

class WeatherTableViewController: UITableViewController, Storybordable {
    
    struct Const {
        static let nibName: String = "WeatherTableViewCell"
        static let forCellReuseIdentifier: String = "weather"
    }
    
    @IBOutlet private weak var mapView: MKMapView!
    
    // MARK: - Properties
    var viewModel: WeatherViewModelProtocol!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupMap(coordinate: viewModel.getCoordinate())
    }
    
    // MARK: - Private func
    private func setupMap(coordinate: CLLocation?) {
        guard let lat = coordinate?.coordinate.latitude else { return }
        guard let long = coordinate?.coordinate.longitude else { return }
        let coordinate = CLLocationCoordinate2D(latitude: lat, longitude: long)
        let addAnotation = MKPointAnnotation()
        addAnotation.coordinate = coordinate
        self.mapView.addAnnotation(addAnotation)
        let zoomRange = MKMapView.CameraZoomRange(minCenterCoordinateDistance: 60000.0, maxCenterCoordinateDistance: 70000.0)
        mapView.setCameraZoomRange(zoomRange, animated: true)
        mapView.setCenter(coordinate, animated: true)
    }
    
    private func setupTableView() {
        tableView.register(UINib(nibName: Const.nibName, bundle: nil), forCellReuseIdentifier: Const.forCellReuseIdentifier)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: Const.forCellReuseIdentifier, for: indexPath) as? WeatherTableViewCell {
            if let model = viewModel?.getCell(at: indexPath) {
                cell.configure(WeatherCellViewModel(model))
            }
            return cell
        }
        return UITableViewCell()
    }
}

// MARK: - ScrollViewDidScroll
extension WeatherTableViewController {
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if let parallax = tableView as? ParallaxTableView {
            DispatchQueue.main.async {
                parallax.animate()
            }
        }
    }
}
