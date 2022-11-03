//
//  LocationView.swift
//  SwiftUIMap
//
//  Created by Victor Henrique de Oliveira on 01/11/22.
//

import MapKit
import SwiftUI

struct LocationView: View {
    @EnvironmentObject private var viewmodel: LocationViewModel
    
    var body: some View {
        ZStack {
            Map(coordinateRegion: $viewmodel.mapRegion)
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                Button(action: viewmodel.toggleShowLocation) {
                    header
                        .padding()
                }
                
                
                if viewmodel.showLocationList {
                    LocationsListView()                    
                }
                
                Spacer()
                
                ZStack {
                    ForEach(viewmodel.locations) { location in
                        if viewmodel.mapLocation == location {
                            LocationPreviewView(location: location)
                                .shadow(color: Color.black.opacity(0.3), radius: 20)
                                .padding()
                                .transition(
                                    .asymmetric(
                                        insertion: .move(edge: .trailing),
                                        removal: .move(edge: .leading)
                                    )
                                )
                        }
                    }
                }
            }
        }
    }
}

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView()
            .environmentObject(
                LocationViewModel(locationService: LocationService())
            )
    }
}

extension LocationView {
    
    private var header: some View {
        VStack {
            Text("\(viewmodel.mapLocation.name) - \(viewmodel.mapLocation.cityName)")
                .font(.title2)
                .fontWeight(.black)
                .foregroundColor(.primary)
                .frame(maxWidth: .infinity)
                .animation(.none, value: viewmodel.mapLocation)
                .overlay(
                    Image(systemName: "arrow.down")
                        .font(.headline)
                        .foregroundColor(.primary)
                        .padding()
                        .rotationEffect(
                            Angle(degrees: viewmodel.showLocationList ? 180 : 0)
                        )
                    ,
                    alignment: .leading
                )
        }
        
        .frame(height: 55)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 15)
    }
}
