//
//  StoreListModel.swift
//  Assignment3
//
//  Created by user250993 on 3/28/24.
//

import Foundation

struct StoreData: Codable {
    let data: [Datum]
}

struct Datum: Codable, Identifiable {
    let id: String
    let storeNumber, divisionNumber, chain: String
    let address: Address
    let geolocation: Geolocation
    let name: String
    let phone: String
    let departments: [Department]

    enum CodingKeys: String, CodingKey {
        case id = "locationId"
        case storeNumber, divisionNumber, chain, address, geolocation, name, phone, departments
    }
}

struct Address: Codable {
    let addressLine1, city, state, zipCode: String
    let county: String?
}

struct Department: Codable {
    let departmentID, name: String
    let phone: String?
    let address: Address?
    let geolocation: Geolocation?
    let offsite: Bool?

    enum CodingKeys: String, CodingKey {
        case departmentID = "departmentId"
        case name, phone, address, geolocation, offsite
    }
}

struct Geolocation: Codable {
    let latitude, longitude: Double
    let latLng: String
}
