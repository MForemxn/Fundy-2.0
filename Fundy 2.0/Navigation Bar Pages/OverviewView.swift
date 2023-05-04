//
//  OverviewView.swift
//  Fundy 2.0
//
//  Created by Mason Foreman on 28/3/2023.
//

import SwiftUI
import CoreData
import SwiftUICharts
import Collections

struct OverviewView: View {
    @EnvironmentObject var transactionListVM: TransactionListViewModel
    var body: some View {
        NavigationView{
            ScrollView{
                VStack(alignment: .leading, spacing: 24) {
                    Text("Overview")
                        .font(.title)
                        .bold()
                    let data = transactionListVM.accumulateTransactions()
                    if !data.isEmpty {
                        LineChartView(data: transactionListVM.determineDailyTotal(), title: "Daily Income", form: ChartForm.large)
                    }
                    RecentTransactionList()
                }
                .padding()
                .frame(maxWidth: .infinity)
            }
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
        .navigationViewStyle(.stack)
        .accentColor(.primary)
    }
}

