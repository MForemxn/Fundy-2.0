//
//  AnalogueClock.swift
//  Fundy 2.0
//
//  Created by Mason Foreman on 20/4/2023.
//

import SwiftUI

struct AnalogueClock: View {
    @State private var currentTime = Date()
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.white)
                .frame(width: 300, height: 300)
                .shadow(color: .gray, radius: 10, x: 5, y: 5)
            
            ForEach(0..<60) { tick in
                Rectangle()
                    .fill(Color.black)
                    .frame(width: tick % 5 == 0 ? 4 : 2, height: tick % 5 == 0 ? 15 : 7)
                    .offset(y: 135)
                    .rotationEffect(.degrees(Double(tick) / 60 * 360))
            }
            
            Rectangle()
                .fill(Color.black)
                .frame(width: 4, height: 100)
                .offset(y: -50)
                .rotationEffect(.degrees(Double(Calendar.current.component(.hour, from: currentTime)) / 12 * 360) +
                    .degrees(Double(Calendar.current.component(.minute, from: currentTime)) / 60 * 30))
            
            Rectangle()
                .fill(Color.black)
                .frame(width: 2, height: 150)
                .offset(y: -75)
                .rotationEffect(.degrees(Double(Calendar.current.component(.minute, from: currentTime)) / 60 * 360))
            
            Rectangle()
                .fill(Color.red)
                .frame(width: 1, height: 75)
                .offset(y: -37.5)
                .rotationEffect(.degrees(Double(Calendar.current.component(.second, from: currentTime)) / 60 * 360))
            
        }
        .onReceive(timer) { input in
            self.currentTime = input
        }
    }
}


