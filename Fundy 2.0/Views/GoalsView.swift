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
        ScrollView{
            HStack {
                VStack {
                    var _ : [Float] = transactionListVM.determineAllCategoryExpenseTotals()
                    PieChartView(
                        values: [1,2,3],
                        names: ["test1", "test2", "test3"],
                        formatter: {value in String(format: "$%.2f", value)},
                        backgroundColor: Color(.systemBackground),
                        widthFraction: 0.95)
                    
                }
                .padding()
            }
        }
    }
}

struct GoalsView_Previews: PreviewProvider {
    static var previews: some View {
        GoalsView()
    }
}
