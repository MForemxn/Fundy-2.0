//
//  GoalsView.swift
//  Fundy 2.0
//
//  Created by Mason Foreman on 28/3/2023.
//

import SwiftUI
import SwiftPieChart
import SwiftUICharts


struct GoalsView: View {
    @EnvironmentObject var transactionListVM: TransactionListViewModel
    @EnvironmentObject var transactionModel: TransactionListViewModel
    var body: some View {
        NavigationView{
            ScrollView{
                HStack{
                    VStack(alignment: .leading, spacing: 24) {
                        PieChartView(values: transactionListVM.findThe3BiggestCategoriesSums(), names: transactionListVM.findThe3BiggestCategoriesLabels(), formatter: {value in String(format: "$%.2f", value)}, colors: [.blue, .green, .orange], backgroundColor: .clear, widthFraction: 0.95, innerRadiusFraction: 0.75)
                    }
                }
                .padding()
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
        .accentColor(.primary)
        .navigationTitle("Goals")
        .navigationViewStyle(.stack)
    }
}
