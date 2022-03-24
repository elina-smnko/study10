//
//  Account.swift
//  Architecture10
//
//  Created by Elina Semenko on 23.03.2022.
//

import Foundation

struct AccountResults: Codable {
    let results: [Account]?
}

struct Account: Codable {
    let gender: String?
    let name: Name?
    let location: Location?
    let phone: String?
    let cell: String?
}

struct Name: Codable {
    let title: String?
    let first: String?
    let last: String?
}

struct Location: Codable {
    let country: String?
    let city: String?
    let postcode: Int?
}
