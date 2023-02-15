//
//  ContentView.swift
//  Frosty
//
//  Created by Loyiso Khumalo on 2023/02/15.
//

import SwiftUI

struct ContentView: View {
    @StateObject var locationManager = LocationManager()
    
    
    var body: some View {

        AnimatedBackground().edgesIgnoringSafeArea(.all)
            .blur(radius: 50)
        
        VStack {
            
            
            if let location = locationManager.location {
                Text("Longitude:  \(location.longitude) | Latitude: \(location.latitude) ")
                    .font(.subheadline)
            } else {
                if locationManager.isLoading {
                    ProgressView()
                } else {
                    WelcomeView()
                        .environmentObject(locationManager)
                }
            }
        }
    }
}
        struct AnimatedBackground: View {
            @State var start = UnitPoint(x: 0, y: -2)
            @State var end = UnitPoint(x: 4, y:0)
            
            let timer = Timer.publish(every: 1, on: .main, in: .default).autoconnect()
            let colors = [Color.purple, Color.orange, Color.red, Color.orange, Color.pink, Color.green, Color.blue, Color.purple]
            var body: some View {
                LinearGradient(gradient: Gradient(colors: colors), startPoint: start, endPoint: end)
                    .animation(Animation.easeInOut(duration: 4)
                        .repeatForever()
                    ).onReceive(timer, perform: { _ in
                        
                        self.start = UnitPoint(x:4, y:0)
                        self.end = UnitPoint(x:0, y:2)
                        self.start = UnitPoint(x:-4, y:20)
                        self.start = UnitPoint(x: 4, y: 0)
                    })
            }
        }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
