//
//  SwiftUIMapApp.swift
//  SwiftUIMap
//
//  Created by Victor Henrique de Oliveira on 01/11/22.
//

import SwiftUI

@main
struct SwiftUIMapApp: App {
    @StateObject private var viewmodel = LocationViewModel(locationService: LocationService())
    
    
    var body: some Scene {
        WindowGroup {
            LocationView()
                .environmentObject(viewmodel)
        }
    }
}
