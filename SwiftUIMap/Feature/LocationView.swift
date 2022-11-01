//
//  LocationView.swift
//  SwiftUIMap
//
//  Created by Victor Henrique de Oliveira on 01/11/22.
//

import SwiftUI

struct LocationView: View {
    @StateObject private var viewmodel = LocationViewModel(locationService: LocationService())
    
    var body: some View {
        List {
            ForEach(viewmodel.locations) {
                Text($0.name)
            }
        }
    }
}

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView()
    }
}
