//
//  PinLocationView.swift
//  SwiftUIMap
//
//  Created by Victor Henrique de Oliveira on 03/11/22.
//

import SwiftUI

struct PinLocationView: View {
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                ZStack {
                    Image.resource.map
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25, height: 25)
                        .font(.headline)
                        .foregroundColor(Color.resource.accentColor)
                }
                .padding(7)
                .background(Color.white)
                .cornerRadius(32)
            }
            .padding(6)
            .background(Color.resource.accentColor)
            .cornerRadius(38)
            
            Image.resource.triangle
                .resizable()
                .scaledToFit()
                .frame(width: 10, height: 10, alignment: .bottom)
                .rotationEffect(Angle(degrees: 180))
                .foregroundColor(Color.resource.accentColor)
                .offset(y: -3)
                .padding(.bottom, 40)
        }
    }
}

struct PinLocationView_Previews: PreviewProvider {
    static var previews: some View {
        PinLocationView()
            .background(Color.blue)
    }
}
