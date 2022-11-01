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
                header
                    .padding()
                
                Spacer()
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
        Color.white
            .overlay(
                VStack {
                    Text("\(viewmodel.mapLocation.name) - \(viewmodel.mapLocation.cityName)")
                        .font(.title2)
                        .fontWeight(.black)
                        .foregroundColor(.primary)
                        .frame(maxWidth: .infinity)
                        .overlay(
                            Image(systemName: "arrow.down")
                                .font(.headline)
                                .foregroundColor(.primary)
                                .padding()
                            ,
                            alignment: .leading
                        )
                }
            )
            .frame(height: 55)
            .cornerRadius(10)
            .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 15)
    }
}
