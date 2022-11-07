//
//  SityListViewModel.swift
//  WeatherParallax
//
//  Created by Andrew Trach on 31.10.2022.
//

import Foundation

protocol SityListViewModelProtocol: AnyObject {
    var filteredTableData: [CityList] { get set }
    var isSearch: Bool { get set }
    var model: CityModel { get set }
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
    
    var model: CityModel
    private let apiService: ApiServise
    var filteredTableData: [CityList] = []
    var isSearch: Bool = false
    
    init(model: CityModel, apiService: ApiServise = ApiServise()) {
        self.model = model
        self.apiService = apiService
    }
    
    func viewDidLoad() {
        getMockData()
    }
    
    func nextButtonTapped(model: OpenWeatherForm, city: CityList) {
        getWeather(model: model, city: city)
    }
    
    func filterText(searchText: String) {
        filteredTableData = model.filter({ (text) -> Bool in
            let tmp: NSString = text.name as NSString
            let range = tmp.range(of: searchText, options: NSString.CompareOptions.caseInsensitive)
            return range.location != NSNotFound
        })
        isSearch = filteredTableData.count != 0
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
