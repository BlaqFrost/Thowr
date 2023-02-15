//
//  WelcomeView.swift
//  Frosty
//
//  Created by Loyiso Khumalo on 2023/02/15.
//

import SwiftUI
import CoreLocationUI

struct WelcomeView: View {
    @EnvironmentObject var locationManager:LocationManager
    
    var body: some View {
        VStack {
            VStack(spacing: 20) {
                Text("Getting Things Warmed Up")
                    .bold()
                    .font(.title2)
                    .padding(30.0)
                Text("Please share your current location to get the weather in your area")
                    .font(.subheadline)
                    .padding(.bottom, 100.0)
            }
            .frame(width: nil, height: 294.0)
            .multilineTextAlignment(.center)
            .padding()
            
            LocationButton(.shareCurrentLocation) {
                locationManager.requestLocation()
            }
            .cornerRadius(21)
            .symbolVariant(.fill)
            .padding(.bottom, 400.0)
            .foregroundColor(.white)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
        }
        
    }
    
    struct WelcomeView_Previews: PreviewProvider {
        static var previews: some View {
            WelcomeView()
        }
        
    }
}
