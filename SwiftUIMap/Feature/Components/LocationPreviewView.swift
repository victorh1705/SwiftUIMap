//
//  LocationPreviewView.swift
//  SwiftUIMap
//
//  Created by Victor Henrique de Oliveira on 01/11/22.
//

import SwiftUI

struct LocationPreviewView: View {
    let location: Location
    
    @EnvironmentObject private var viewmodel: LocationViewModel
    
    var body: some View {
        HStack(alignment: .bottom, spacing: 0) {
            VStack(alignment: .leading, spacing: 16) {
                imageSection
                titleSection
            }
         
            VStack(spacing: 8) {
                learnMoreButton
                nextButton
            }
        }
        .padding(20)
        .background(
            Color.white
                .opacity(0.7)
                .offset(y: 65)
        )
        .cornerRadius(10)
    }
}

struct LocationPreviewView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.blue.ignoresSafeArea()
            
            LocationPreviewView(location: LocationsDataService.locations.first!)
        }
    }
}

extension LocationPreviewView {
    var imageSection: some View {
        ZStack {
            if let imageName = location.imageNames.first! {
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    
                    .frame(width: 100, height: 100)
                    .cornerRadius(10)
            }
        }
        .padding(6)
        .background(Color.white)
        .cornerRadius(10)
    }
    
    var titleSection: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(location.name)
                .font(.title2)
                .fontWeight(.bold)
            
            Text(location.cityName)
                .font(.subheadline)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    // MARK: buttons
    var learnMoreButton: some View {
        Button {
            viewmodel.sheetLocation = location
        } label: {
            Text("Learn More")
                .font(.headline)
                .frame(width: 125, height: 35)
                .foregroundColor(Color.white)
        }
        .background(Color.red)
        .cornerRadius(10)
    }
    
    var nextButton: some View {
        Button {
            viewmodel.nextButtonPressed()
        } label: {
            Text("Next")
                .font(.headline)
                .frame(width: 125, height: 35)
        }
        .background(Color.black.opacity(0.1))
        .cornerRadius(10)
    }
}
