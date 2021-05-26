//
//  LocationPresenter.swift
//  travel
//
//  Created by Svetlana Safonova on 17.05.2021.
//

import UIKit

class LocationCountryPresenter: LocationViewOutput {

    weak var view: LocationViewInput?
    
    private var locationService: LocationService = LocationService()
    
    init(view: LocationViewInput, locationService: LocationService) {
        self.view = view
        self.locationService = locationService
    }
    
    func viewDidLoad() {
        locationService.requestMeth() { [weak self] result in
            switch result {
            case .success(let countries):
                self?.view?.data = countries
                DispatchQueue.main.async {
                    self?.view?.countriesTableView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
    }

}
