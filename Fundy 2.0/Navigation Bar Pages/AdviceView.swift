//
//  AdviceView.swift
//  Fundy 2.0
//
//  Created by Mason Foreman on 28/3/2023.
//

import SwiftUI

struct Advice: Identifiable, Hashable {
    var id = UUID()
    var title: String
    var description: String
}

struct AdviceView: View {
    let actions: [Advice] = [
        Advice(title: "Create a budget", description: "Track your income and expenses to better manage your money."),
        Advice(title: "Pay off debt", description: "Eliminate high-interest debt to save money in the long run."),
        Advice(title: "Invest in stocks", description: "Grow your wealth by investing in the stock market."),
        Advice(title: "Save for retirement", description: "Start saving for retirement early to ensure financial security."),
        Advice(title: "Reduce expenses", description: "Cut unnecessary expenses to save money each month.")
    ]
    
    @State private var selectedAction: Advice?
    
    var body: some View {
        NavigationView {
                List(actions) { action in
                    NavigationLink(destination: ActionDetail(action: action), tag: action, selection: $selectedAction) {
                        Text(action.title)
                    }
                }
                .navigationBarTitle("Finance Actions")
                .background(Color.background)
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem {
                        NavigationLink {
                            NotificationsView()
                        } label: {
                            Image(systemName: "bell.badge")
                                .symbolRenderingMode(.palette)
                                .foregroundStyle(Color.icon, .primary)
                        }
                    }
                }
        }
    }
    
    struct ActionDetail: View {
        let action: Advice
        
        var body: some View {
            VStack(alignment: .leading) {
                Text(action.title)
                    .font(.title)
                    .padding(.bottom)
                Text(action.description)
                    .font(.body)
            }
            .padding()
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem {
                    NavigationLink {
                        NotificationsView()
                    } label: {
                        Image(systemName: "bell.badge")
                            .symbolRenderingMode(.palette)
                            .foregroundStyle(Color.icon, .primary)
                    }
                }
            }
        }
    }
}

struct AdviceView_Previews: PreviewProvider {
    static var previews: some View {
        AdviceView()
    }
}
