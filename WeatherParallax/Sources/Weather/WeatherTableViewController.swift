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
        let nibName: String = "WeatherTableViewCell"
        let forCellReuseIdentifier: String = "weather"
    }
    
    @IBOutlet private weak var mapView: MKMapView!
    
    // MARK: - Properties
    var viewModel: WeatherViewModel!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupMap(lat: viewModel.city?.coord.lat, long: viewModel.city?.coord.lon)
    }
    
    // MARK: - Private func
    private func setupMap(lat: Double?, long: Double?) {
        guard let lat = lat else { return }
        guard let long = long else { return }
        let coordinate = CLLocationCoordinate2D(latitude: lat, longitude: long)
        let addAnotation = MKPointAnnotation()
        addAnotation.coordinate = coordinate
        addAnotation.title = viewModel.city?.name
        self.mapView.addAnnotation(addAnotation)
        let zoomRange = MKMapView.CameraZoomRange(minCenterCoordinateDistance: 60000.0, maxCenterCoordinateDistance: 70000.0)
        mapView.setCameraZoomRange(zoomRange, animated: true)
        mapView.setCenter(coordinate, animated: true)
    }
    
    private func setupTableView() {
        tableView.register(UINib(nibName: Const().nibName, bundle: nil), forCellReuseIdentifier: Const().forCellReuseIdentifier)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: Const().forCellReuseIdentifier, for: indexPath) as? WeatherTableViewCell {
            if let model = viewModel?.model {
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
