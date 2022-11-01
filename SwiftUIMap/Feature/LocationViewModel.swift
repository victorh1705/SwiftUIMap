//
//  LocationViewModel.swift
//  SwiftUIMap
//
//  Created by Victor Henrique de Oliveira on 01/11/22.
//

import SwiftUI

class LocationViewModel: ObservableObject {
    
    let locationService: LocationServiceProtocol
    
    @Published var locations: [Location]
    
    init(locationService: LocationServiceProtocol) {
        self.locationService = locationService
        self.locations = locationService.fetch()
    }
}
