//
//  Homepage.swift
//  Fundy 2.0
//
//  Created by Mason Foreman on 27/2/2023.
//

import SwiftUI
import CoreData

struct Homepage: View {
    @State var showWhatsNewSheet = false
    
    var body: some View {
        NavigationView{
            TabView {
                GoalsView()
                    .tabItem() {
                        Image(systemName: "target")
                        Text("Goals")
                    }
                OverviewView()
                    .tabItem() {
                        Image(systemName: "dollarsign")
                        Text("Overview")
                    }
                AdviceView()
                    .tabItem() {
                        Image(systemName: "book.fill")
                        Text("Advice")
                    }
            }
            .onAppear {
                showWhatsNewSheet = true
            }
            .sheet(isPresented: $showWhatsNewSheet) {
                WhatsNewView()
            }
        }
    }
}

struct Homepage_Previews: PreviewProvider {
    static var previews: some View {
        Homepage()
    }
}

