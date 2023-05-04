//
//  RecentAccountCredits.swift
//  Fundy 2.0
//
//  Created by Mason Foreman on 28/3/2023.
//



import SwiftUI
import CoreData
import SwiftUICharts


struct RecentAccountCredits: View {
    @EnvironmentObject var transactionListVM: TransactionListViewModel
    var body: some View {
        ScrollView{
            VStack(alignment: .leading, spacing: 24) {
                // MARK: Title
                Text("Recent Account Credits")
                    .font(.title2)
                    .bold()
                
                // MARK: Chart
                let data = transactionListVM.accumulateTransactions()
                
                
                if !data.isEmpty {
                    let totalExpenses = data.last?.1 ?? 0
                    LineChartView(data: transactionListVM.determineDailyTotal(), title: "Title", legend: "Legendary") // legend is optional
                }
            }
        }
    }
}

