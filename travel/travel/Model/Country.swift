//
//  LocationModel.swift
//  travel
//
//  Created by Svetlana Safonova on 17.05.2021.
//

import UIKit

struct Countries: Codable {
    var data: [Country]
}

struct Country: Codable {
    var country: String
    var cities: [String]
}
