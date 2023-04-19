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
    // var demoData: [Double] = [8, 2, 4, 6, 12, 9, 2]
    var body: some View {
        NavigationView{
            ScrollView{
                VStack(alignment: .leading, spacing: 24) {
                    // MARK: Title
                    Text("Overview")
                        .font(.title)
                        .bold()
                    
                    // MARK: Chart
                    let data = transactionListVM.accumulateTransactions()
                    
                    // MARK: Chart
                    if !data.isEmpty {
                        let totalExpenses = data.last?.1 ?? 0
                        LineChartView(data: transactionListVM.determineDailyTotal(), title: "Daily Income", form: ChartForm.large) // legend is optional
                    }
                    // MARK: Recent Transactions List
                    RecentTransactionList()
                }
                .padding()
                .frame(maxWidth: .infinity)
            }
            .background(Color.background)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                // MARK: Notification Icon
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

struct OverviewView_Previews: PreviewProvider {
    static let transactionListVM: TransactionListViewModel = {
        let TransactionListVM = TransactionListViewModel()
        transactionListVM.transactions = transactionListPreviewData
        return TransactionListVM
    } ()
    
    static var previews: some View {
        Group {
            ContentView()
            ContentView()
                .preferredColorScheme(.dark)
        }
        .environmentObject(transactionListVM)
    }
}
