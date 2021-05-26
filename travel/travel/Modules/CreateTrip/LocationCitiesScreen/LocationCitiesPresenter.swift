//
//  LocationCitiesPresenter.swift
//  travel
//
//  Created by Svetlana Safonova on 19.05.2021.
//

import UIKit

class LocationCitiesPresenter: LocationCitiesViewOutput {
    
    weak var view: LocationCitiesViewInput?
    
    
    
    init(view: LocationCitiesViewInput, data: Country) {
        self.view = view
        self.view?.cities = data.cities
        self.view?.country = data.country
    }
    
    func viewDidLoad() {
        
    }
    
    
}
