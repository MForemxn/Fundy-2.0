//
//  GoalsView.swift
//  Fundy 2.0
//
//  Created by Mason Foreman on 28/3/2023.
//

import SwiftUI
import SwiftPieChart


struct GoalsView: View {
    @EnvironmentObject var transactionListVM: TransactionListViewModel
    @EnvironmentObject var transactionModel: TransactionListViewModel
    var body: some View {
        NavigationView{
            ScrollView{
                HStack {
                    VStack(alignment: .leading, spacing: 24) {
                        ZStack {
                            PieChartView(values: transactionListVM.findThe3BiggestCategoriesSums(), names: transactionListVM.findThe3BiggestCategoriesLabels(), formatter: {value in String(format: "$%.2f", value)}, widthFraction: 0.85)
                                .backgroundColor(Color.background)
                                //.text(Color.primary)
                        }
                        .background(Color.background)
                    }
                    .frame(maxWidth: .infinity)
                    .background(Color.background)
                }
                .background(Color.background)
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
        .navigationTitle("Goals")
        .background(Color.background)
    }
}
