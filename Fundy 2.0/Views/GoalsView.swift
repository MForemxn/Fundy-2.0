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
    var body: some View {
        ScrollView{
            HStack {
                VStack {
                    PieChartView(
                        values: [1300, 500, 300],
                        names: ["Rent", "Transport", "Education"],
                        formatter: {value in String(format: "$%.2f", value)},
                        backgroundColor: Color(.systemBackground),
                        widthFraction: 0.95)

                }
                .padding()
            }
            .padding()
        }
    }
}

struct GoalsView_Previews: PreviewProvider {
    static var previews: some View {
        GoalsView()
    }
}
