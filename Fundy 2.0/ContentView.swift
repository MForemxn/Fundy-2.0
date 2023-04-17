//
//  ContentView.swift
//  Fundy 2.0
//
//  Created by Mason Foreman on 27/2/2023.
//

import SwiftUI
import CoreData
//import SwiftUICharts

struct ContentView: View {
    var body: some View {
            TabView {
                WhatsNewView()
                    .tabItem() {
                        Image(systemName: "person.crop.circle.dashed")
                        Text("What's New")
                    }
                LoginScreen()
                    .tabItem() {
                        Image(systemName: "apple.logo")
                        Text("Login Page")
                    }
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
            }
        }
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
