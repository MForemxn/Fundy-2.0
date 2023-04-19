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
                        Text("Goals")
                            .font(.title)
                            .bold()
                        PieChartView(values: transactionListVM.findThe3BiggestCategoriesSums(), names: transactionListVM.findThe3BiggestCategoriesLabels(), formatter: {value in String(format: "$%.2f", value)}, backgroundColor: Color.background, widthFraction: 0.95)
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                }
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

struct GoalsView_Previews: PreviewProvider {
    static var previews: some View {
        GoalsView()
    }
}
