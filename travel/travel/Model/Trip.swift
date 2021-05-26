//
//  Trip.swift
//  travel
//
//  Created by Svetlana Safonova on 22.05.2021.
//

import Foundation
import FirebaseFirestoreSwift

struct Trip: Codable {
    var id: UUID
    var title: String
    var uid: String?
    var username: String?
    var isPrivate: Bool
    var startDate: Date?
    var endDate: Date?
    var budget: Decimal
    var plans: [Plan]
    var dailyPlans: [DailyPlan]
    var isLiked: Bool?
}

struct Plan: Codable {
//    @DocumentID var id: String?
    var location: String
    var planTitle: String
    var startDate: Date?
    var endDate: Date?
    var budget: Decimal
    var transports: [Transport]
    var residences: [Residence]
}

struct Transport: Codable {
//    @DocumentID var id: String?
    var type: TransportType
    var startDate: Date?
    var endDate: Date?
    var from: String
    var whereTo: String
    var budget: Decimal
}

enum TransportType: String, Codable {
    case Default = "default"
    case Car = "Car"
    case Airplane = "Airplane"
    case Train = "Train"
    case Bus = "Bus"
}

struct Residence: Codable {
//    @DocumentID var id: String?
    var name: String
    var startDate: Date?
    var endDate: Date?
    var budget: Decimal
}

struct DailyPlan: Codable {
    var description: String
    var startTime: Date?
    var endTime: Date?
}
