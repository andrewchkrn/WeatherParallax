//
//  SityListViewModel.swift
//  WeatherParallax
//
//  Created by Andrew Trach on 31.10.2022.
//

import Foundation

protocol SityListViewModelProtocol: AnyObject {
    var isSearch: Bool { get set }
    func numberOfRouth() -> Int
    func filterNumberOfRouth() -> Int
    func getCell(at indexPath: IndexPath) -> CityList
    func getFilteredCell(at indexPath: IndexPath) -> CityList
    func viewDidLoad()
    func nextButtonTapped(model: OpenWeatherForm, city: CityList)
    func filterText(searchText: String)
}

protocol SityListViewProtocol: AnyObject {
    func openNextScreen(model: OpenWeather, city: CityList)
}

class SityListViewModel: SityListViewModelProtocol {
    
    // MARK: - Properties
    weak var view: SityListViewProtocol?
    
    private var model: CityModel
    private let apiService: ApiServise
    private var filteredTableData: [CityList] = []
    var isSearch: Bool = false
    
    init(model: CityModel, apiService: ApiServise = ApiServise()) {
        self.model = model
        self.apiService = apiService
    }
    
    func viewDidLoad() {
        getMockData()
    }
    
    func numberOfRouth() -> Int {
        return model.count
    }
    
    func filterNumberOfRouth() -> Int {
        return filteredTableData.count
    }
    
    func getCell(at indexPath: IndexPath) -> CityList {
        return model[indexPath.row]
    }
    
    func getFilteredCell(at indexPath: IndexPath) -> CityList {
        return filteredTableData[indexPath.row]
    }
    
    func nextButtonTapped(model: OpenWeatherForm, city: CityList) {
        getWeather(model: model, city: city)
    }
    
    func filterText(searchText: String) {
            self.filteredTableData = self.model.filter({ (text) -> Bool in
                let tmp: NSString = text.name as NSString
                let range = tmp.range(of: searchText, options: NSString.CompareOptions.caseInsensitive)
                return range.location != NSNotFound
            })
            self.isSearch = self.filteredTableData.count != 0
    }
    
    private func getWeather(model: OpenWeatherForm, city: CityList ) {
        apiService.getWeather(form: model) { [weak self] (result) in
            switch result {
            case .success(let model):
                self?.view?.openNextScreen(model: model, city: city)
            case .failure(_): break
            }
        }
    }
    
    private func getMockData() {
        guard let path = Bundle.main.url(forResource: "city_list", withExtension: "json") else { return }
        do {
            let data = try Data(contentsOf: path)
            let result = try JSONDecoder().decode(CityModel.self, from: data)
            self.model = result
        } catch {
            print(error)
        }
    }
}
