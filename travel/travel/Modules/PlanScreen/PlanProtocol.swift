//
//  TripProtocol.swift
//  travel
//
//  Created by Svetlana Safonova on 26.05.2021.
//

import Foundation

protocol PlanViewOutput {
    func viewDidLoad()
    func getTransportCount() -> Int
    func getResidencesCount() -> Int
    func getTransport(index: Int) -> Transport
    func getResidence(index: Int) -> Residence
}

protocol PlanViewInput: AnyObject {
    var plan: Plan? { get set }
}
