//
//  LocationViewModel.swift
//  SwiftUIMap
//
//  Created by Victor Henrique de Oliveira on 01/11/22.
//

import MapKit
import SwiftUI

class LocationViewModel: ObservableObject {
    
    let locationService: LocationServiceProtocol
    
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    
    @Published var locations: [Location]
    
    @Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion()
    @Published var mapLocation: Location {
        didSet {
            updateMapRegion(location: mapLocation)
        }
    }
    
    
    init(locationService: LocationServiceProtocol) {
        self.locationService = locationService
        self.locations = locationService.fetch()
        
        let firstLocation = locationService.fetch().first!
        
        self.mapLocation = firstLocation
        self.updateMapRegion(location: firstLocation)
    }
    
    private func updateMapRegion(location: Location) {
        withAnimation(.easeInOut) {
            mapRegion = MKCoordinateRegion(
                center: location.coordinates,
                span: mapSpan
            )
        }
    }
}
