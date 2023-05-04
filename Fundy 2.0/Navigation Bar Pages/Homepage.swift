//
//  Homepage.swift
//  Fundy 2.0
//
//  Created by Mason Foreman on 27/2/2023.
//

import SwiftUI
import CoreData

struct Homepage: View {
    @State var whatsNewSheetHasBeenShown = false
    
    var body: some View {
        NavigationView{
            TabView {
                OverviewView()
                    .tabItem() {
                        Image(systemName: "dollarsign")
                        Text("Overview")
                    }
                GoalsView()
                    .tabItem() {
                        Image(systemName: "target")
                        Text("Goals")
                    }
                AdviceView()
                    .tabItem() {
                        Image(systemName: "book.fill")
                        Text("Advice")
                    }
                SettingsPage()
                    .tabItem() {
                        Image(systemName: "gear")
                        Text("Settings")
                    }
                AnalogueClock()
                    .tabItem() {
                        Image(systemName: "clock.fill")
                        Text("Clock")
                    }
            }
            .onAppear {
                if !whatsNewSheetHasBeenShown {
                    whatsNewSheetHasBeenShown = true
                }
            }
            .sheet(isPresented: $whatsNewSheetHasBeenShown) {
                WhatsNewView()
            }
        }
    }
}

