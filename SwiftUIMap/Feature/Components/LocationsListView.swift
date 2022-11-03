//
//  LocationsListView.swift
//  SwiftUIMap
//
//  Created by Victor Henrique de Oliveira on 01/11/22.
//

import SwiftUI

struct LocationsListView: View {
    
    @EnvironmentObject private var viewmodel: LocationViewModel
    
    var body: some View {
        List {
            ForEach(viewmodel.locations) { location in
                Button {
                    viewmodel.showNextLocation(location: location)
                } label: {
                    buildListView(location)
                }
                .padding(.vertical, 4)
                .listRowBackground(Color.clear)
            }
        }
        .listStyle(PlainListStyle())
    }
}

struct LocationsListView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsListView()
            .environmentObject(
                LocationViewModel(locationService: LocationService())
            )
    }
}

extension LocationsListView {
    private func buildListView(_ location: Location) -> some View {
        HStack {
            if let imageName = location.imageNames.first! {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 45, height: 45)
                    .cornerRadius(10)
            }
            
            VStack(alignment: .leading) {
                Text(location.name)
                    .font(.headline)
                Text(location.cityName)
                    .font(.subheadline)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}
