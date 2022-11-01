//
//  LocationService.swift
//  SwiftUIMap
//
//  Created by Victor Henrique de Oliveira on 01/11/22.
//

import Foundation

struct LocationService: LocationServiceProtocol {
    func fetch() -> [Location] {
        LocationsDataService.locations
    }
}
