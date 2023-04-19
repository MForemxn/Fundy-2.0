//
//  AdviceView.swift
//  Fundy 2.0
//
//  Created by Mason Foreman on 28/3/2023.
//

import SwiftUI
import SwiftUICharts

struct AdviceView: View {
    @EnvironmentObject var transactionListVM: TransactionListViewModel
    var body: some View {
        LineView(data: transactionListVM.determineDailyTotal(), title: "Line chart", legend: "Full screen") // legend is optional, use optional .padding()
            .padding()

//        ZStack {
//            Color.green
//
//            Image(systemName: "book.fill")
//                .foregroundColor(Color.white)
//                .font(.system(size: 100.0))
            
            
//        }
    }
}

struct AdviceView_Previews: PreviewProvider {
    static var previews: some View {
        AdviceView()
    }
}
